require 'rails_helper'
require 'factories'

RSpec.describe 'Products', type: :request do
  describe 'POST /add_to_cart' do 
    let(:product) { create(:product) }

    context 'when user is not logged in' do 
      it 'redirects him to login page' do 
        post add_to_cart_product_path(product.id)

        expect(response).to redirect_to(login_path)
      end
    end
  end
end
