class ApplicationController < ActionController::Base
  include SessionsHelper

  def authenticate_user
    @current_user = current_user
    if @current_user == nil
      flash[:notice] = "ログインをしてください。"
      redirect_to new_session_path
    end
  end
  #admin = trueの場合のみ管理者画面を表示させたい。
  def authenticate_admin
    @current_user = current_user
    if @current_user.admin == false
      flash[:notice] = "管理者IDでログインしてください"
      redirect_to new_session_path
    end
  end
end
