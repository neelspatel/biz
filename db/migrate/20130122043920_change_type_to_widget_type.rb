class ChangeTypeToWidgetType < ActiveRecord::Migration
  def change
	remove_column :widgets, :type
	add_column :widgets, :widget_type, :string
  end
end
