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
  end

  private

    def group_params
      params.require(:group).permit(:name)
    end
end
