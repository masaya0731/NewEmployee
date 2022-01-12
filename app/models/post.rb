class Post < ApplicationRecord
  attachment :post_image

  has_many :post_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :tag_maps, dependent: :destroy

  belongs_to :customer, optional: true
  belongs_to :category, optional: true

  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true
end
