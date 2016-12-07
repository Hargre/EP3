class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :index, :show, :match]

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = "Grupo criado!"
      redirect_to @group
    else
      render 'root'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @user = @group.user
    @group.destroy
    redirect_to @user
  end

  def show
    @group = Group.find(params[:id])
    @participant = @group.participants.build
    @participants = @group.participants.order('created_at ASC')
                          .paginate(per_page: 15, page: (params[:page]))
  end

  def match
    @group = Group.find(params[:group])
    @group.participants.each do |participant|
      potential_giftees = Participant.matchable(group: @group, participant: participant)
      giftee = potential_giftees.sample
      if giftee.blank?
        @group.participants.update_all(giftee_id: nil, matched: false)
        flash[:danger] = 'Sorteio não realizado, tente novamente.'
        redirect_to group_path(@group) and return
      else
        participant.giftee_id = giftee.id
        giftee.matched = true
        participant.save && giftee.save
      end
    end
    if @group.all_matched
      @group.matched = true
      @group.save
      send_emails(@group)
      flash.now[:success] = 'Sorteio realizado com sucesso!'
    end
  end

  private

    def group_params
      params.require(:group).permit(:name)
    end

    def send_emails(group)
      group.participants.each do |participant|
        GroupMailer.match_confirmation(participant, participant.giftee, @group).deliver
      end
    end
end
