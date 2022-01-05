class Post < ApplicationRecord

  attachment :post_image

  has_many :post_cpmments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  belongs_to :customers
  belongs_to :category

end
