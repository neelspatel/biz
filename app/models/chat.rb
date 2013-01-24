class Chat < ActiveRecord::Base
  attr_accessible :content, :from, :merchant_id, :user_id

  belongs_to :user
  belongs_to :merchant
end
