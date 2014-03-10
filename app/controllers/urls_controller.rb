class UrlsController < ApplicationController

  def new
    @user = User.where(id: session[:user_id]).first
    @url = Url.new
  end

  def create
    @user = User.where(id: session[:user_id]).first
    p params
    @url = Url.new(long_url: params[:url][:long_url], click_count: 0, user_id: @user.id)

    if @url.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

end