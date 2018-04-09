class ModifyUsersTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :username
    remove_column :users, :email 
  end
end
