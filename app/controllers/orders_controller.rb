class OrdersController < ApplicationController
  def create
    @carted_products = current_user.carted_products.where("status=?", "carted")
    subtotal = 0
      @carted_products.each do |carted_product|
        subtotal += carted_product.product.price.to_i * carted_product.quantity.to_i
      end
    tax = subtotal.to_f * 0.09
    total = subtotal + tax
    order = Order.create(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
      )
    @carted_products.update(status: "purchased", order_id: order.id)
    flash[:success] = "Successfully ordered product(s)!"
    redirect_to "show.html.erb"
  end
  def show
    redirect_to "/"
  end
end




