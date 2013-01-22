class AddUsers < ActiveRecord::Migration
  def up
  	create_table(:users) do |t|
  		## Database authenticatable
  		t.string :unique_cookie
  	end
  end

  def down
  	drop_table(:users)
  end
end
