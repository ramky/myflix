class Video < ActiveRecord::Base
  has_many :video_categories
  has_many :categories, through: :video_categories
  has_many :reviews

  validates_presence_of :title, :description
end
