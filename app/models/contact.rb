class Contact < ApplicationRecord

  validates :name, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :email, presence: true

end
