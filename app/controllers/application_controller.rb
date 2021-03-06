class ApplicationController < ActionController::Base
  include SessionsHelper

  def authenticate_user
    @current_user = current_user
    if @current_user == nil
      flash[:notice] = "ログインをしてください。"
      redirect_to new_session_path
    end
  end
end
