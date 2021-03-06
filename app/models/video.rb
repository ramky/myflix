class Video < ActiveRecord::Base
  has_many :video_categories
  has_many :categories, through: :video_categories
  has_many :reviews, -> { order 'created_at DESC' }
  has_many :queue_items
  accepts_nested_attributes_for  :categories

  mount_uploader :large_cover_image, LargeCoverUploader
  mount_uploader :small_cover_image, SmallCoverUploader

  validates_presence_of :title, :description

  def self.search_by_title(search_term)
    return [] if search_term.blank?
    where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
  end

  def rating
    return 0.0 if self.reviews.count == 0
    sum = self.reviews.reduce(0.0) { |sum, review| sum + review.rating  }
    "%.1f" % ( sum / self.reviews.count )
  end
end

