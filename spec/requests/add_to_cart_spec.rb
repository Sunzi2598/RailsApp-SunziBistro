require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'POST /add_to_cart' do 
    let!(:product) { Product.create(title: 'Pizza Salami', description: 'Pizza', price: 12.0) }

    context 'when user is not logged in' do 
      it 'redirects him to login page' do 
        post add_to_cart_product_path(product.id)

        expect(response).to redirect_to(login_path)
      end
    end
  end
end
