class OrdersController < ApplicationController
  before_action :admin_user, only: [:index, :deliver_order]

  def index
    @orders = Order.all
  end

  def create
    order = current_user.orders.build
    @cart = Cart.find_or_create_by!(user_id: current_user.id)
    
    @cart.order_items.each do | product |
      order.order_details.build(product_id: product.product_id, quantity: product.quantity)
    end

    order.save
    @cart.destroy

    redirect_to(root_path)
  end

  def deliver_order
    order = Order.find(params[:id])
    order.toggle(:handled)
    order.save

    redirect_to(orders_path)
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
