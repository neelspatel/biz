class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :unique_cookie, :current_merchant_id

  has_many :chats, :dependent => :destroy
  
end
