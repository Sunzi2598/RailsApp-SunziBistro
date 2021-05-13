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

    respond_to do |format|
      if @product.save 
        format.html { redirect_to @product, notice: 'Product added successfully!' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params) 
        format.html { redirect_to @product, notice: 'Product updated successfully!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format| 
      format.html { redirect_to dashboard_path, notice: 'Product deleted!' } 
    end
  end

  def id
    @id ||= params[:id].to_i
  end

  def add_to_cart
    return redirect_to login_path unless logged_in?

    session[:cart] << id 
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
