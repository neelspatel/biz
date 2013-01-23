class WidgetsController < ApplicationController

  

  #allows a new turf
  def new
    @title = "Create New Widget"
    @widget = Widget.new
  end

  def show
    @widget = Widget.find(params[:id]) 
    @items = @widget.items
    @item = Item.new
   
  end
  
  #creates a new turf, and stores the lat long and accuracy based on the current used values
  def create
    @type = params[:type][:value].to_s
    @widget = current_merchant.widgets.build("widget_type" => @type.to_s)
        
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
