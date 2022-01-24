# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contactモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { contact.valid? }

    let(:contact) { FactoryBot.create(:contact) }

    context 'nameカラム' do
      it '空欄でないか' do
        contact.name = ''
        is_expected.to eq false
      end
      it '20文字以下であるか' do
        contact.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字不可' do
        contact.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end

    context 'emailカラム' do
      it '空欄でないか' do
        contact.email = ''
        is_expected.to eq false
      end
    end

    context 'titleカラム' do
      it '空欄でないか' do
        contact.title = ''
        is_expected.to eq false
      end
      it '200文字以下であるか' do
        contact.title = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であるか:201文字不可' do
        contact.title = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end

    context 'bodyカラム' do
      it '空欄でないか' do
        contact.body = ''
        is_expected.to eq false
      end
      it '500文字以下であるか' do
        contact.body = Faker::Lorem.characters(number: 500)
        is_expected.to eq true
      end
      it '500文字以下であるか: 501文字不可' do
        contact.body = Faker::Lorem.characters(number: 501)
        is_expected.to eq false
      end
    end
  end
end