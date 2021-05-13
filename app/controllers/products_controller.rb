class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :initialize_session
  before_action :load_cart

  def index
    @products = Product.all
  end

  def show; end

  def edit; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params.except(:image))
    @product.image.attach(product_params[:image])

    if @product.save
      flash[:success] = 'Product added successfully!'
      redirect_to @product 
    else 
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:success] = 'Product updated successfully!'
      redirect_to @product 
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:success] = 'Product deleted!'
    redirect_to dashboard_path
  end

  def id
    @id ||= params[:id].to_i
  end

  def add_to_cart
    return redirect_to login_path unless logged_in?

    session[:cart] << id unless session[:cart].include?(id)
    redirect_to root_path
  end

  def remove_from_cart
    session[:cart].delete(id)
    redirect_to root_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end

  private

  def initialize_session
    session[:cart] ||= []
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end
  
end
