class AddUniquenessConstraint < ActiveRecord::Migration[5.1]
  def change
    remove_index(:artwork_shares, [:artwork_id, :viewer_id])
    add_index(:artwork_shares, [:artwork_id, :viewer_id], unique: true )
  end
end
