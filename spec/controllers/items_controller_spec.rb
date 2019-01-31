require 'rails_helper'

describe ItemsController, type: :controller do

  describe 'Get #detail' do
    it "正しいビューに遷移する" do
      c1 = create(:category)
      s1 = create(:user)
      b1 = create(:user)
      item = create(:item, category_id: c1.id, seller_id: s1.id, buyer_id: b1.id)
      get :detail, params: { id: item }
      expect(assigns(:item)).to eq item
    end

    it "@itemが期待される値を持つ" do
      item = create(:item)
    end

    it "@userが期待される値を持つ" do
      user = create(:user)
    end

    it "カテゴリーが生成されるか" do
    end

  end
end
