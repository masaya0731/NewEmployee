# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PostCommentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post_comment.valid? }

    let(:customer) { FactoryBot.create(:customer) }
    let(:post) { build(:post, customer_id: customer.id) }
    let!(:post_comment) { build(:post_comment, customer_id: customer.id, post_id: post.id) }

    context 'bodyカラム' do
      it '空欄でないか' do
        post_comment.body = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Customerモデル' do
      it 'N:1になっているか' do
        expect(PostComment.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

    context 'Postモデル' do
      it 'N:1になっているか' do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end
