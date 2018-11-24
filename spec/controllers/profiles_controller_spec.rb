require 'rails_helper'

describe ProfilesController, type: :controller do

  describe 'GET #edit' do

    let(:user) { create(:user) }
    let(:params) {{ user_id: user.id }}
    context 'ログイン中' do
      it "editのビューが返されているか" do
        login user
        get :edit, params: params
        expect(response).to render_template :edit
      end
    end

    context 'ログアウト中' do
      it 'new_user_sesssion_pathにリダイレクトされるか' do
        get :edit, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH #update' do

    let(:user) { create(:user) }
    let(:update_attributes) {{ nickname: "update_name", profile: "update_profile" }}
    let(:params) {{ user_id: user.id, user: update_attributes  }}
    context 'ログイン中' do
      before do
        login user
      end
      context '更新できる' do
        subject {
          patch :update,
          params: params
        }
        it '更新しても件数が増えないかどうか' do
          expect{ subject }.not_to change(User, :count)
        end

        it '新しい値に書き換わっているか' do
          subject
          user.reload
          expect(user.nickname).to eq update_attributes[:nickname]
          expect(user.profile).to eq update_attributes[:profile]
        end

        it 'editのビューが返されているか' do
          subject
          expect(response).to render_template :edit
        end
      end

      context '更新できない' do
        subject {
          patch :update,
          params: params
        }
        it 'editのビューが返されているか' do
          params[:user][:nickname] = nil
          subject
          expect(response).to render_template :edit
        end
      end

    end

    context 'ログアウト中' do
      it 'new_user_sesssion_pathにリダイレクトされるか' do
        get :update, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
