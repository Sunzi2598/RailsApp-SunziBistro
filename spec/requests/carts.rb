require 'rails_helper'

RSpec.describe 'Carts', type: :request do
  describe 'GET /cart' do 

    context 'when user is not logged in' do 
      it 'redirects him to login page' do 
        get cart_path

        expect(response).to redirect_to(login_path)
      end
    end
  end
end
