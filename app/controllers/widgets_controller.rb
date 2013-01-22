class WidgetsController < ApplicationController

  

  #allows a new turf
  def new
    @title = "Create New Widget"
    @widget = Widget.new
  end
  
  #creates a new turf, and stores the lat long and accuracy based on the current used values
  def create
    #@parameters = { "type" => params[:type], "data" => params[:data]}
    @parameters = params

    #saves type and removes irrelevant shit from params
    @type = @parameters[:type]
    @parameters.delete("type")
    @parameters.delete("utf8")
    @parameters.delete("authenticity_token")
    @parameters.delete("commit")
    @parameters.delete("action")
    @parameters.delete("controller")

    #turns it into a json shit thing
    @json = ActiveSupport::JSON.encode(@parameters)

    @widget = current_merchant.widgets.build({"widget_type" => @type, "data" => @json})
        
    if @widget.save
      # Handle a successful save.
      flash[:success] = "Thanks for creating the widget!"
      redirect_to @widget
    else
      @title = "Create New Widget"      

      #we should definitely fix this long term - this should be in a partial, but i can't get it to work right there
      initial_error = "Sorry, errors prohibited this widget from being created, including:"
      errors = [initial_error]

      if @widget.errors.any?    
        @widget.errors.full_messages.each do |msg|
          errors << msg
        end
        flash[:error] = errors.join("<br/>   - ").html_safe
      end
    end
  end
  
end
