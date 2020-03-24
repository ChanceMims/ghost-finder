class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  has_one_attached :image
end
