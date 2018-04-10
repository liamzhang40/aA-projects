class ModifyUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :artwork_shares do |t|
      t.string :username, null: false
      t.timestamps
    end
  end
end
