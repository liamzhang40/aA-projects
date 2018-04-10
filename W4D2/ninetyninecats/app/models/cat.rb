class Cat < ApplicationRecord
  COLORS = ['brown', 'black', 'orange', 'grey', 'white']
  validates :birthdate, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: %w(M F) }

  has_many :rental_requests,
    class_name: 'CatRentalRequest',
    dependent: :destroy

  def age
    time_ago_in_words(birthdate)
  end
end
