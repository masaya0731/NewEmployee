# frozen_string_literal: true

require 'rails_helper'

describe 'Categoryモデルのテスト', type: :model do
  it '1:Nになっている' do
    expect(Category.reflect_on_association(:posts).macro).to eq :has_many
  end
end