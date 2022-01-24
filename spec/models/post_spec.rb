# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { post.valid? }

    let(:customer) { FactoryBot.create(:customer) }
    let!(:post) { build(:post, customer_id: customer.id) }

    context 'titleカラム' do
      it '空欄でないか' do
        post.title = ''
        is_expected.to eq false
      end
    end

    context 'bodyカラム' do
      it '空欄でないか' do
        post.body = ''
        is_expected.to eq false
      end
    end

  end

  describe 'アソシエーションのテスト' do

     context 'PostCommentモデル' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end

    context 'Notificationモデル' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end

    context 'TagMapモデル' do
      it '1:Nになっているか' do
        expect(Post.reflect_on_association(:tag_maps).macro).to eq :has_many
      end
    end

    context 'Tagモデル' do
      it '1:Nになっているか' do
        expect(Post.reflect_on_association(:tags).macro).to eq :has_many
      end
    end

    context 'Customerモデル' do
      it 'N:1になっているか' do
        expect(Post.reflect_on_association(:customer).macro).to eq :belongs_to
      end
    end

    context 'Categoryモデル' do
      it 'N:1になっているか' do
        expect(Post.reflect_on_association(:category).macro).to eq :belongs_to
      end
    end

  end
end