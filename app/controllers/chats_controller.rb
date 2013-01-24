class ChatsController < ApplicationController
	def new
      @chat = Chat.new(params[:chat])
  	end

	def create		
        @chat = Chat.new({:user_id => params[:user_id][:value], :merchant_id => params[:merchant_id][:value], :content => params[:content], :from => params[:from][:value]})

        if @chat.save
	      # Handle a successful save.
	      flash[:success] = "Thanks for creating the chat!"
	      
	      if merchant_signed_in?
	      	#redirect_to @chat
	      	redirect_to @chat
	      else
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
			params[:current_chat_user_id] = @chat.user_id
		end
	end
end