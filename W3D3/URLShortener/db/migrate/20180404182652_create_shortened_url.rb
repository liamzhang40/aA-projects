class CreateShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, unique: true
      t.string :long_url, null: false, unique: true
      t.integer :user_id, null: false, unique: true
      t.timestamps
    end
  end
end
