class RecreateAnswers < ActiveRecord::Migration
  def change
  	drop_table :answers

    create_table :answers do |t|
      t.integer :item_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
