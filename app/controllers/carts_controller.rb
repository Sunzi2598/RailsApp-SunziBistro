class CartsController < ApplicationController

  def show
    @order_items = current_user.cart.order_items
  end

  def destroy
    current_user.cart.order_items.destroy_all

    redirect_to(cart_path)
  end
end
