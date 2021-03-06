# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord
  validates :artwork_id, uniqueness: {scope: :viewer_id,
    message: "one artwork can be shared with one viewer"}
    
  belongs_to :viewer,
    class_name: 'User',
    foreign_key: :viewer_id

  belongs_to :artwork,
    class_name: 'Artwork',
    foreign_key: :artwork_id
end
