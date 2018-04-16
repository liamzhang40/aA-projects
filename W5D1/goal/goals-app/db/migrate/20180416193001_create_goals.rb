class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
