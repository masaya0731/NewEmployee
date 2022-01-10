class Contact < ApplicationRecord

  validates :name, presence: true, length: { maximum: 20 }
  validates :title, presence: true, length: { maximum: 200 }
  validates :body, presence: true, length: { maximum: 500 }
  validates :email, presence: true

end
