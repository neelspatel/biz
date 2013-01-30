class UsersController < ApplicationController
  def new
    @user = User.new
    @user.save
  end
  
  def create
    @value = 1

    @user = User.new({:unique_cookie => cookies[:biz_recognized_cookie_user], :current_merchant_id => @value})
    #@user.current_merchant_id = 5
    @user.save!
  end
end