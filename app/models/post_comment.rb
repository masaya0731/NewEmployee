class PostComment < ApplicationRecord

  attachment :comment_image

  has_many :notifications, dependent: :destroy

  belongs_to :customer
  belongs_to :post

end
