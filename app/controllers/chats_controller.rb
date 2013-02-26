class ChatsController < ApplicationController
	
	respond_to :html, :js

	def index
		if merchant_signed_in?
			@list = params[:counts]
			
			@merchant_id = params[:merchant_id]
			@active_id = params[:active]
			@active_change = false

			@update_list = []


		    logger.debug "Entering Loop"

		    if @list
				@list.each do |item|
				    
				    @user_id = item[0]
				    @old_count = item[1]
				    
				    logger.debug "User ID"
				    logger.debug @user_id

				    logger.debug "Active ID"
				    logger.debug @active_id

				    logger.debug "Old Counts"
				    logger.debug @old_counts

				    @new_count = Chat.find(:all, :conditions => {:merchant_id => @merchant_id, :user_id => @user_id}).count.to_s

				    logger.debug "New Counts"
				    logger.debug @new_counts
				    
				    if (@new_count.to_i > @old_count.to_i)
				    	if (@user_id.to_i == @active_id.to_i)
				    		logger.debug("Shit should be called")
				    		@active_change = true
				    	end
				       @update_list <<  [ @user_id, @new_count] 
				       logger.debug @update_list
				    end
				end
			end

		    logger.debug "Exiting Loop"

		    if @active_change 
				@chats = Chat.find(:all, :conditions => {:merchant_id => params[:merchant_id], :user_id => params[:active] })    	
			else
				@chats = []
			end

			respond_with (@chats)
		else
			@chats = Chat.find(:all, :conditions => {:merchant_id => current_user.current_merchant_id, :user_id => current_user.id})			
		end
	end

	def new
      @chat = Chat.new(params[:chat])
  	end

	def create	
		if merchant_signed_in?
			@user_id = session[:current_chat_user_id]
		else
			@user_id = current_user.id
		end	
        @chat = Chat.new({:user_id => @user_id, :merchant_id => params[:merchant_id][:value], :content => params[:chat_content], :from => params[:from][:value]})
		logger.debug("Just created chat with user id #{session[:current_chat_user_id]}")
		logger.debug("Params is #{session.inspect}")
        if @chat.save
	      # Handle a successful save.
	      flash[:success] = "Thanks for creating the chat!"
	      
	      if merchant_signed_in?
	      	#redirect_to @chat
			respond_with(@chat)	
	      else
	      	#respond_with(@chat)		    
	      	redirect_to "/pages/useremulate"
      	  end
	    else
	      #we should definitely fix this long term - this should be in a partial, but i can't get it to work right there
	      initial_error = "Sorry, errors prohibited this widget from being created, including:"
	      errors = [initial_error]

	      if @chat.errors.any?    
	        @chat.errors.full_messages.each do |msg|
	          errors << msg
	        end
	        flash[:error] = errors.join("<br/>   - ").html_safe
	      end
	    end
	end
	

	def show

		@chat = Chat.find(params[:id])

		#if the user is a merchant, then add the chat to the params hash
		if merchant_signed_in?
			session[:current_chat_user_id] = @chat.user_id
			logger.debug("Just set current_chat_user_id to #{@chat.user_id} which is #{params[:current_chat_user_id]}")	
			@chats = Chat.find(:all, :conditions => {:merchant_id => current_merchant.id, :user_id => session[:current_chat_user_id]})
			respond_with @chats
		else
			@chats = Chat.find(:all, :conditions => {:merchant_id => current_user.current_merchant_id, :user_id => current_user.id})
			redirect_to "/chats"
		end


		# find all of the chats that belong to this conversation
	
	
	end
end