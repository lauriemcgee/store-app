class OrdersController < ApplicationController
  def create
    product_id = params[:id]
    product = Product.find_by(id: params[:product_id])
    @subtotal = product.price * params[:quantity].to_i
    @product_tax = @subtotal * 0.09
    @order_total = @subtotal + @product_tax

    order = Order.create(
        user_id: current_user.id,
        product_id: params[:product_id],
        quantity: params[:quantity],
        subtotal: @subtotal,
        tax: @product_tax,
        total: @order_total
      )
    flash[:success] = "Successfully ordered product(s)!"
    redirect_to "/orders/#{order.id}"
  end
  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end
end

