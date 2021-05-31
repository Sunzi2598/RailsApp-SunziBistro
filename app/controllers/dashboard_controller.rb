class DashboardController < ApplicationController
  before_action :admin_user, only: :index

  def index
    @products = Product.all
  end

  private 
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
