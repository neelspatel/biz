class AddMerchantIndex < ActiveRecord::Migration
  def up
	add_index :widgets, :merchant_id
  end

  def down
  end
end
