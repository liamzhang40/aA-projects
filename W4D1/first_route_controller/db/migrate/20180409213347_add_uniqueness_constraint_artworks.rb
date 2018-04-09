class AddUniquenessConstraintArtworks < ActiveRecord::Migration[5.1]
  def change
    remove_index(:artworks, [:artist_id, :title])
    add_index(:artworks, [:artist_id, :title], unique: true )
  end
end
