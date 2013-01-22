class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :type
      t.integer :merchant_id
      t.text :data

      t.timestamps
    end
  end
end
