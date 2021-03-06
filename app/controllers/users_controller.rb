class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy]
  before_action :admin_user,     only: :destroy

  def show
    @user  = User.find(params[:id])
    @group = @user.groups.build
    @groups = @user.groups.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuário removido"
    redirect_to users_url
  end

  def index
    @users = User.all
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
