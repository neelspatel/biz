class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :instantiateUser
	helper_method :current_user
	helper :all


	#creates a user, including cookie verification or cookie creation
	def instantiateUser
		#checks if cookie exists; if not, creates it
		if(!cookies[:biz_recognized_cookie_user] || !User.find(:all, :conditions => {:unique_cookie => cookies[:biz_recognized_cookie_user]}).first)
			require 'digest/md5'
			@cookie_value = Digest::MD5.hexdigest(Time.now.to_s+ request.remote_ip.to_s)
			cookies[:biz_recognized_cookie_user] = { :value => @cookie_value, :expires => 100.years.from_now }

			#creates a new user with this value			
			@current_merchant_id = 5
			@user = User.new({:unique_cookie => @cookie_value, :current_merchant_id => @current_merchant_id})
			@user.save
			session[:user_id] = @user.id

			@current_user = @user
		else
			puts cookies[:biz_recognized_cookie_user]
			@user = User.find(:all, :conditions => {:unique_cookie => cookies[:biz_recognized_cookie_user]}).first
			session[:user_id] = @user.id
			@current_user = @user
		end

	end

  
	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def mobile_device?
      request.user_agent =~ /Mobile|webOS/
    end
    helper_method :mobile_device?

end
