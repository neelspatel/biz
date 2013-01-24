class AddCurrentMerchantIdToUsers < ActiveRecord::Migration
  def change
	add_column :users, :current_merchant_id, :integer

  end
end
