class Post < ApplicationRecord

  has_many :post_cpmments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  belongs_to :customers
  belongs_to :category

end
