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

  def show
    @group = Group.find(params[:id])
    @participant = @group.participants.build
    @participants = @group.participants.order('created_at ASC')
                          .paginate(per_page: 15, page: (params[:page]))
  end

  private

    def group_params
      params.require(:group).permit(:name)
    end
end
