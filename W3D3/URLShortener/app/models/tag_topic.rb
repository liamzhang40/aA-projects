class TagTopic < ApplicationRecord
  validates :topic, presence: true, uniqueness: true

  has_many(
    :taggings,
    class_name: 'Tagging',
    foreign_key: :tag_topic_id,
    primary_key: :id
  )
  has_many(
    :urls,
    through: :taggings,
    source: :url
  )

  def popular_links
    self.urls.joins(:visits)
      .group('shortened_urls.id')
      .select('shortened_urls.id, count(visits.id) as counts')
      .order('counts DESC').limit(5)
  end


end
