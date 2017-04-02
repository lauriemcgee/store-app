class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    if @carted_products.length > 0
    render "index.html.erb"
    else
      flash[:warning]="Ya gotta put somethin in the cart!"
      redirect_to "/"
    end
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
  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    flash[:success]= "Aight, it's gone!"
    redirect_to "/"
  end
end
