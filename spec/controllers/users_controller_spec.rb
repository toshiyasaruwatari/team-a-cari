require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe 'GET #new' do

    context 'log in' do
      before do
        login user
      end

      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'not log in' do

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  describe 'POST #create' do
    let(:params) { create(:user) }

    context 'valid params' do
      subject {
        post :create,
        params: params
      }

      it 'save params' do
        expect{ subject }.to change(User, :count).by(1)
      end

      it 'redirects to root_path' do
        subject
        expect(response).to redirect_to(root_path)
      end
    end

    context 'invalid params' do
      let(:invalid_params) {}

      subject {
        post :create,
        params: invalid_params
      }

      it 'does not save params' do
        expect{ subject }.not_to change(User, :count)
      end

      it 'redisplay the :new template' do
        subject
        expect(response).to render_template :new
      end
    end
  end
end
