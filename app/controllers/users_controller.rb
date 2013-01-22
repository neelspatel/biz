class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(session[:biz_recognized_cookie_user])
    @user.save
  end
end