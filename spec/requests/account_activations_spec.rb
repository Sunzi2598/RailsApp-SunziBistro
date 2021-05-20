require 'rails_helper'

RSpec.describe 'Account Activations', type: :request do
  describe 'GET root_url' do 
    let!(:user) { User.create(name: 'Sunzuiana Alexandra',
                            email: 'sunzuianaalexandra@gmail.com', 
                            password: 'ratusca',
                            password_confirmation: 'ratusca',
                            activated: false) }

    context 'when account is not activated' do 
      it 'redirects the user to login page' do 
        post login_path, params: { session: { email: user.email, password: user.password } }

        expect(response).to redirect_to(login_path)
      end
    end

    context 'when account is activated' do 
      it 'redirects the user to root page' do 
        user.update_attribute(:activated, true)
        post login_path, params: { session: { email: user.email, password: user.password } }

        expect(response).to redirect_to(user)
      end
    end
  end
end