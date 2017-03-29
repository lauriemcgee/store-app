class CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where("status=?", "carted")
    render "index.html.erb"
  end
  def create
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    quantity = params[:quantity]
    @subtotal = product.price * quantity.to_i
    @product_tax = @subtotal * 0.09
    @order_total = @subtotal + @product_tax

    carted_product = CartedProduct.create(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        status: "carted"
      )
    flash[:success] = "Successfully ordered product(s)!"
    redirect_to "/checkout"
  end
end
