require 'rails_helper'

describe OrdersController, type: :controller do

 describe 'GET #new' do

    let(:user) { create(:user) }
    let(:item) { create(:item) }
    let(:params) {{ item_id: item.id }}
    context 'ログイン中' do
      before do
        login user
      end
      subject {
        get :new,
        params: params
      }
      it "@orderがあるか" do
        subject
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "@itemがあるか" do
        subject
        expect(assigns(:item)).to eq(item)
      end

      it "newアクションのビューを描画しているか" do
        subject
        expect(response).to render_template :new
      end
    end

    context '未ログイン' do
      it 'new_user_sesssion_pathにリダイレクトされるか' do
        get :new, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end