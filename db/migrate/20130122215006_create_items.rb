class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :widget_id
      t.text :data

      t.timestamps
    end
	add_index :items, :widget_id

    add_column :widgets, :item_id, :integer
    remove_column :widgets, :data
  end
end
