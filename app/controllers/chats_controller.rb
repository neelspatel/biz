class ChatsController < ApplicationController
	def new
      @chat = Chat.new(params[:chat])
  	end

	def create		
        @chat = Chat.new({:user_id => params[:user_id][:value], :merchant_id => params[:merchant_id], :content => params[:content], :from => params[:from]})

        if @chat.save
	      # Handle a successful save.
	      flash[:success] = "Thanks for creating the chat!"
	      redirect_to "/"
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
	end
end