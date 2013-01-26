@list = params[:counts]
@merchant_id = params[:merchant_id]

@update_list = []

@list.each do |item|
	@user_id = item[0]
	@old_counts = item[1]

	@new_counts = Chat.find(:all, :conditions => {:merchant_id => @merchant_id, :user_id => @user_id}).count

	if @new_counts != @old_counts:
		@update_list << @user_id
	end
end