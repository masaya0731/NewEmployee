class TagMap < ApplicationRecord
  # 投稿とタグの中間テーブル
  belongs_to :post
  belongs_to :tag
end
