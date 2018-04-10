class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.date :birthdate, null:false
      t.string :color, null:false
      t.string :name, null:false
      t.string :sex, limit: 1, null:false
      t.text :description, null:false
      t.timestamps
    end

    add_index :cats, :name
  end
end
