module CartsHelper
  def current_cart
    if !session[:cart_id].nil?
      @current_cart = Cart.find(session[:cart_id])
    else
      @current_cart = Cart.new
    end
  end
end
