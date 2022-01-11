class Post < ApplicationRecord
  attachment :post_image

  has_many :post_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  belongs_to :customer, optional: true
  belongs_to :category, optional: true

  validates :title, presence: true
  validates :body, presence: true
end
