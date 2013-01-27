class AnswersController < ApplicationController
  #allows a new answer
  def new
    @title = "Create New Answer"
    @answer = Answer.new
  end

  def show
    @answer = Answer.find(params[:id])        
  end
  
  def create
    #@parameters = { "type" => params[:type], "data" => params[:data]}
    @parameters = params
    @item_id = @parameters[:item_id_value][:value]
    @widget_id = @parameters[:widget_id_value][:value]
    #saves type and removes irrelevant shit from params     
    @question_type = @parameters[:question_type][:value]
    @user_id = @parameters[:user_id][:value]

    if @question_type == "multiple-choice"
      logger.debug("trying to get a submission, i'm here")
      logger.debug(@parameters.inspect)

      @content = @parameters[:answer][:content]
      @answer = Answer.new({:item_id => @item_id, :content => @content, :user_id => @user_id.to_i})
    elsif @question_type == "slider"
      logger.debug("trying to get a submission, i'm here")
      logger.debug(@parameters.inspect)
      @answer = Answer.new({:item_id => @item_id, :content => @parameters[:slider], :user_id => @user_id.to_i})
    end

    if @answer.save
      # Handle a successful save.
      flash[:success] = "Thanks for creating the answer!"
      #respond_with (@answer)
      redirect_to Widget.find(@widget_id)
    else
      @title = "Create New answer"      

      #we should definitely fix this long term - this should be in a partial, but i can't get it to work right there
      initial_error = "Sorry, errors prohibited this answer from being created, including:"
      errors = [initial_error]

      if @item.errors.any?    
        @item.errors.full_messages.each do |msg|
          errors << msg
        end
        flash[:error] = errors.join("<br/>   - ").html_safe
      end
    end
end
  
end
