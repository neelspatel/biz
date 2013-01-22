class Widget < ActiveRecord::Base
  attr_accessible :data, :merchant_id, :widget_type

  belongs_to :merchant
end
