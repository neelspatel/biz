class AddAttributesToMerchants < ActiveRecord::Migration
  def self.up
  	add_column :merchants, :name, :string
  	add_column :merchants, :address, :string
  	add_column :merchants, :phone_number, :string  	
  	add_column :merchants, :domain, :string
  end
  def self.down
  	remove_column :merchants, :name, :string
  	remove_column :merchants, :address, :string
  	remove_column :merchants, :phone_number, :string  	
  	remove_column :merchants, :domain, :string
  end
end
