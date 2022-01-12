class Post < ApplicationRecord
  attachment :post_image

  has_many :post_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  belongs_to :customer, optional: true
  belongs_to :category, optional: true

  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true

  def save_tag(sent_tags)
    # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = tags.pluck(:name) unless tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      tags.delete Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      tags << new_post_tag
    end
  end
end
