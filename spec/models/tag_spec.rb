# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Tagモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'TagMapモデル' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:tag_maps).macro).to eq :has_many
      end
    end

    context 'Postモデル' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end
end