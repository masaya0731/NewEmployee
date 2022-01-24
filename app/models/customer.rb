class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 100 }
end
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Postモデル' do
      it 'N:1になっているか' do
        expect(Notification.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end

    context 'PostCommentモデル' do
      it 'N:1になっているか' do
        expect(Notification.reflect_on_association(:post_comment).macro).to eq :belongs_to
      end
    end

    context '通知を送ったユーザー' do
      it 'N:1になっているか' do
        expect(Notification.reflect_on_association(:visitor).macro).to eq :belongs_to
      end
    end

    context '通知が送られたユーザー' do
      it 'N:1になっているか' do
        expect(Notification.reflect_on_association(:visited).macro).to eq :belongs_to
      end
    end
  end
end