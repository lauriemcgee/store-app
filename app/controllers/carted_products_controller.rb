class CartedProductsController < ApplicationController
  def index
    
    @carted_products = current_user.carted_products.where("status=?", "carted")
    render "index.html.erb"
  end
  def create
    carted_product = CartedProduct.create(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        status: "carted"
      )
    flash[:success] = "Successfulled added to cart!"
    redirect_to "/checkout"  
  end
end
