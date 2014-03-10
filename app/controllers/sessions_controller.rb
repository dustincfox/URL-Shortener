class SessionsController < ApplicationController


  def new
    # @user = User.where(id: params[:id]).first
  end

  def create
    @user = User.where(user_name: params[:session][:user_name]).first
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :create
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end

end