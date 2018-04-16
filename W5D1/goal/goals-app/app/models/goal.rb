class Goal < ApplicationRecord
  validates :user, :body, presence: true
  belongs_to :user
end
