class Widget < ActiveRecord::Base
  attr_accessible :merchant_id, :widget_type

  belongs_to :merchant

  has_many :items, :dependent => :destroy

end
