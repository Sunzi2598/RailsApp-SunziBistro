class OrderItemsController < ApplicationController

  def create
    if logged_in?
      @cart = Cart.find_or_create_by!(user_id: current_user.id)
      @product = Product.find(params[:id])
      @order_item = OrderItem.find_by(cart: @cart, product: @product)
      
      if @order_item.nil?
        @order_item = OrderItem.new(cart: @cart, product: @product, quantity: 1)
        @order_item.save
      else
        @order_item.update(quantity: @order_item.quantity + 1)
      end

      redirect_to(cart_path)
    else
      redirect_to(login_path)
    end
  end

  def add_quantity
    @order_item = OrderItem.find(params[:id])

    @order_item.update(quantity: @order_item.quantity + 1)

    redirect_to(cart_path)
  end

  def reduce_quantity
    @order_item = OrderItem.find(params[:id])

    if @order_item.quantity > 1
      @order_item.update(quantity: @order_item.quantity - 1)

      redirect_to(cart_path)
    end    
  end

  def destroy
    @order_item = OrderItem.find(params[:id]).destroy

    redirect_to(cart_path)
  end

  def total_price
    self.quantity * self.product.price
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
