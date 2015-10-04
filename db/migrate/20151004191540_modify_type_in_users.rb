class ModifyTypeInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :user_type, :integer
  	add_column :users, :type, :string
  end
end
