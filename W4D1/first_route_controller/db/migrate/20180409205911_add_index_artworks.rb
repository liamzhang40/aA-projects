class AddIndexArtworks < ActiveRecord::Migration[5.1]
  def change
    add_index(:artworks, [:artist_id, :title])
  end
end
