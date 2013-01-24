class Item < ActiveRecord::Base
  attr_accessible :data, :widget_id

  belongs_to :widget
  has_many :answers, :dependent => :destroy

end
