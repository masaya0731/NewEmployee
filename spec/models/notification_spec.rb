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
