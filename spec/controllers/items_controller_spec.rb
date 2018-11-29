require 'rails_helper'

describe ItemsController, type: :controller do

  describe 'GET #index' do

    let(:user) { create(:user) }
    let(:items) { create_list(:item, 5, user_id: user.id) }
    context 'ログイン中' do
      before do
        login user
        get :index
      end

      it "populates an array of item ordered by created_at DESC" do
        expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at })
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    context 'ログアウト中' do
      before do
        get :index
      end
      it "populates an array of item ordered by created_at DESC" do
        expect(assigns(:items)).to match(items.sort{ |a, b| b.created_at <=> a.created_at })
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end
  end

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
  end

  describe 'Get #edit' do

    let(:user) { create(:user) }
    let(:prefectures) { create_list(:prefecture, 2) }
    let(:item) { create(:item, user: user, prefecture_id: prefectures[0].id) }
    let(:categories) { create_list(:category, 3) }
    let(:sizes) { create_list(:size, 2) }
    let(:brands) { create_list(:brand, 2) }

    context 'ログイン中' do
      before do
        login user
        get :edit, params: { id: item }
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

      it "returns ok" do
        expect(response).to have_http_status :ok
      end
    end
  end

  describe 'PATCH #update' do
    let!(:item) { create(:item) }
    let(:update_item) { create(:item, user_id: item.user.id) }
    let(:update_attributes) {{
      attributes_for: update_item
    }}
    let(:params) {{ id: item.id, item: update_attributes }}

    it 'saves updated item' do
      patch :update, params: params
    end
  end


  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:item) { create(:item, user_id: user.id, prefecture_id: prefecture.id) }
    let(:prefecture) { create(:prefecture) }
    let(:params) {{ item: attributes_for(:item, category_ids: [], user_id: user.id, prefecture_id: prefecture.id) }}
    context 'ログイン中' do
      before do
        login user
      end
      context '保存できる' do
        subject {
          post :create,
          params: params
        }

        it 'itemが増えたかどうか' do
          category_ids = []
          item.categories.each do |category|
            category_ids << category.id
          end
          params[:item][:category_ids] = category_ids
          src = [item.item_images[0].item_image_src]
          params[:item][:item_images_attributes] = { "0": { "item_image_src": src } }
          expect{ subject }.to change(Item, :count).by(1)
        end
      end

      context '保存できない' do
        it 'new_item_pathにリダイレクトされるか' do
          post :create, params: params
          expect(response).to render_template(:new)
        end
      end
    end

    context '未ログイン' do
      it 'new_user_sesssion_pathにリダイレクトされるか' do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
