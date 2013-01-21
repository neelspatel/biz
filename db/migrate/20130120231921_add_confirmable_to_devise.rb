class AddConfirmableToDevise < ActiveRecord::Migration
  def self.up  	
    add_column :merchants, :confirmation_token, :string
    add_column :merchants, :confirmed_at,       :datetime
    add_column :merchants, :confirmation_sent_at , :datetime
    add_column :merchants, :unconfirmed_email, :string

    add_index  :merchants, :confirmation_token, :unique => true
  end
  def self.down
    remove_index  :merchants, :confirmation_token

    remove_column :merchants, :unconfirmed_email
    remove_column :merchants, :confirmation_sent_at
    remove_column :merchants, :confirmed_at
    remove_column :merchants, :confirmation_token
  end
end
