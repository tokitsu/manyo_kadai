class UsersController < ApplicationController



  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end


  end
end
