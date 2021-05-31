class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

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

      redirect_to(@product)
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
       flash[:success] = 'Product updated successfully!'
       
       redirect_to(@product)
     else
       render 'edit'
     end
   end
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    flash[:success] = 'Product deleted!'

    redirect_to(dashboard_path)
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
end
