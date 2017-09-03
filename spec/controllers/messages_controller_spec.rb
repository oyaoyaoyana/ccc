require 'rails_helper'
require 'pry-rails'

describe MessagesController, :type => :controller do
  let(:user) {create(:user)}
  let(:group) {create(:group)}
  let(:message) {create(:message)}
  # let(:message_group_id) {attributes_for(:message, group_id: group)}
  let(:vaild_params) { {group_id: group, message: attributes_for(:message)}}

    describe 'GET #index' do
      context 'ログインしている場合' do
        before do
          user = create(:user)
          login_user user
          get :index, params: {group_id: group}
        end

        it "メッサージのindexに行くか" do
          expect(response).to render_template :index
        end

        it "アクション内で定義している@messageがあるか" do
          expect(assigns(:message)).to be_a_new Message
        end

        it "アクション内で定義している@groupがあるか" do
          expect(assigns(:group)).to eq group
        end

        it "アクション内で定義している@messagesがあるか" do
          expect(assigns(:messages)).to eq(group.messages)
        end

        it "該当するビューが描画されているか（index）" do
          expect(response).to render_template(:index)
        end
      end
    end

    describe 'ログインしていない場合' do
      before do
        get :index, params: { group_id: group.id }
      end
      it "意図したビューにリダイレクトできているか" do
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'POST #index' do
      context 'ログインしている場合' do
        before do
          user = create(:user)
          login_user user
          get :index, params: { group_id: group.id }
        end

        it 'メッセージの保存はできたのか' do
          expect{
            post :create,
            params: vaild_params
          }
          .to change(Message, :count).by(1)
        end

        it "意図した画面に遷移しているか" do
          post :create, params: vaild_params

          expect(response).to redirect_to group_messages_path
        end

        it "メッセージの保存は行われなかったか" do
          expect(
            post :create,
            params: {
              message: {body: '', image: ''},
              group_id: group.id
            }
         ).to render_template(:index)
        end

        it "該当するビューが描画されているか（index）" do
          expect(response).to render_template(:index)
        end
      end
    end

    describe 'ログインしていない場合' do
      before do
        get :index, params: { group_id: group.id }
      end
      it "意図したビューにリダイレクトできているか" do
        expect(response).to redirect_to new_user_session_path
      end
    end

end
