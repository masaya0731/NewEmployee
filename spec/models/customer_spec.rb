# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { customer.valid? }

    let!(:other_customer) { FactoryBot.create(:customer) }
    let(:customer) { FactoryBot.create(:customer) }

    context 'nameカラム' do
      it '空欄でないか' do
        customer.name = ''
        is_expected.to eq false
      end
      it '20文字以下であるか' do
        customer.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であるか: 21文字不可' do
        customer.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '100文字以下であるか' do
        customer.introduction = Faker::Lorem.characters(number: 100)
        is_expected.to eq true
      end
      it '100文字以下であること: 101文字不可' do
        customer.introduction = Faker::Lorem.characters(number: 101)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデル' do
      it '1:Nになっているか' do
        expect(Customer.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context 'PostCommentモデル' do
      it '1:Nになっているか' do
        expect(Customer.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
  end
end