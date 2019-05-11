class UsersController < ApplicationController

  before_action :authenticate_user,{only:[:show]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:admin] && @user.save
      redirect_to admin_users_path
    elsif params[:admin]
      redirect_to new_admin_user_path
      #↑その場しのぎ本当はアドミンニューにレンダーさせてたい。
    elsif @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)
    elsif
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.new(user_params)
    if params[:admin] && @user.update(user_params)
      redirect_to admin_users_path
    elsif params[:admin]
      redirect_to edit_admin_user_path
      #↑その場しのぎ本当はレンダーさせたい
    elsif @user.update
      redirect_to user_path(@user.id)
    elsif
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:admin)
  end
end
