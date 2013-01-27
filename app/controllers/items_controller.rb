class ItemsController < ApplicationController
	
	respond_to :html, :js
	
	def new
	      @item = Item.new(params[:item])
  	end

	def create
		#@parameters = { "type" => params[:type], "data" => params[:data]}
	    @parameters = params
	    @widget_id = @parameters[:widget_id_value][:value]
	    #saves type and removes irrelevant shit from params	    
 	    @parameters.delete("widget_id_value")
	    @parameters.delete("type")
	    @parameters.delete("utf8")
	    @parameters.delete("authenticity_token")
	    @parameters.delete("commit")
	    @parameters.delete("action")
	    @parameters.delete("controller")

	    #turns it into a json shit thing
	    @json = ActiveSupport::JSON.encode(@parameters)

        @item = Item.new({:widget_id => @widget_id, :data => @json})

        if @item.save
	      # Handle a successful save.
	      flash[:success] = "Thanks for creating the item!"
	      redirect_to Widget.find(@widget_id)
	    else
	      @title = "Create New Item"      

	      #we should definitely fix this long term - this should be in a partial, but i can't get it to work right there
	      initial_error = "Sorry, errors prohibited this item from being created, including:"
	      errors = [initial_error]

	      if @item.errors.any?    
	        @item.errors.full_messages.each do |msg|
	          errors << msg
	        end
	        flash[:error] = errors.join("<br/>   - ").html_safe
	      end
	    end
	end

	def destroy
		# find the item, then find the widget - 2 database queries fix in future
	    @item = Item.find(params[:id])
	    
	    @widget = Widget.find_by_id(@item.widget_id)
	    
	    
	    if @item.destroy
	      flash[:success] = "Item destroyed!" 
	      redirect_to(@widget)     
	    else
	      flash[:error] = "Sorry, item not destroyed"
	    end
	    
	  end

	def show
		@item = Item.find(params[:id])
	end
end
