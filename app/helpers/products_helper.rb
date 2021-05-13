module ProductsHelper
  
  def total_price(cart)
    cart.to_a.sum{ |product| product.price }
  end
end
