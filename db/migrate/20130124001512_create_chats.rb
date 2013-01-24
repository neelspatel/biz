class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :user_id
      t.integer :merchant_id
      t.text :content
      t.string :from

      t.timestamps
    end
  end
end
