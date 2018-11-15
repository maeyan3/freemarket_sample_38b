require 'rails_helper'

describe ItemsController, type: :controller do

  describe 'GET #new' do

    let(:user) { create(:user) }
    let(:item) { create(:item) }
    let(:categories) { create_list(:category, 3) }
    let(:sizes) { create_list(:size, 2) }
    let(:brands) { create_list(:brand, 2) }
    let(:prefectures) { create_list(:prefecture, 2) }

    context 'ログイン中' do
      before do
        login user
        get :new
      end

      it 'ビューが期待通りのものになっているか' do
        expect(response).to render_template :new
      end

      it '@itemがあるか' do
        expect(assigns(:item)).to be_a_new(Item)
      end

      it '@categoriesがあるか' do
        expect(assigns(:categories)).to eq(categories)
      end

      it '@sizesがあるか' do
        expect(assigns(:sizes)).to eq(sizes)
      end

      it '@brandsがあるか' do
        expect(assigns(:brands)).to eq(brands)
      end

      it '@prefecturesがあるか' do
        expect(assigns(:prefectures)).to eq(prefectures)
      end

    end

    context '未ログイン' do
      it 'new_user_sesssion_pathにリダイレクトされるか' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#create' do
  end

end
