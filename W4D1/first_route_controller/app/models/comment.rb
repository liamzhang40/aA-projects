# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  artwork_id :integer          not null
#  body       :text             not null
#

class Comment < ApplicationRecord

  belongs_to :author,
    class_name: 'User',
    foreign_key: :user_id

  belongs_to :artwork,
    class_name: 'Artwork',
    foreign_key: :artwork_id
end
