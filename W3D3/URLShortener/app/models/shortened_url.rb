class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    while true
      random = SecureRandom.urlsafe_base64
      unless ShortenedUrl.where(short_url: random).exists?
        return random
      end
    end
  end

  def self.shorten_url(user, long_url)
    ShortenedUrl.create!(short_url: ShortenedUrl.random_code, long_url: long_url, user_id: user.id)
  end


  belongs_to(
    :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: 'Visit',
    foreign_key: :short_url_id,
    primary_key: :id
  )

  has_many(
    :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user
  )

  has_many(
    :taggings,
    class_name: 'Tagging',
    foreign_key: :url_id,
    primary_key: :id
  )
  has_many(
    :tags,
    through: :taggings,
    source: :tag_topic
  )

  def num_clicks
    self.visitors.count
  end

  def num_uniques
    self.visitors.count
  end

  def recent_uniques
    self.visitors.where("visits.updated_at > ?", 10.minutes.ago).count
  end

  def no_spamming
    visits_in_last_five = ShortenedUrl.joins(:visits).where("visits.updated_at > ? AND visits.user_id=1", 1000.minutes.ago).select('count(visits.user_id)').group('user_id')
    if visits_in_last_five.first.attributes['count'] > 4
      raise "No More Clicks Poor User! Buy Premium for more clicks!"
    end
    p visits_in_last_five.first.attributes['count']
  end

end
