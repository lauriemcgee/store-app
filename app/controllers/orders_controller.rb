class OrdersController < ApplicationController
  def create
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product_tax = product.price * .08
    order_total = product.price + product_tax
    order = Order.create(
        user_id: current_user.id
        product_id: product_id
        quantity: params[:quantity]
        subtotal: product.price
        tax: product_tax
        total: order_total
      )
    flash[:success] = "Successfully created account!"
    redirect_to "show.html.erb"
  end
  def show
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    order_id = product.order_id
  end

end

