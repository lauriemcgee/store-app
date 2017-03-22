class ProductsController < ApplicationController
  def index
    if session[:count] == nil
      session[:count] = 0
    else
      session[:count] += 1
    end
    @page_count = session[:count]
    @products = Product.all
    render "index.html.erb"
  end
  def new
    render "new.html.erb"
  end
  def create
    @product = Product.create(
        name: params[:name],
        description: params[:description],
        price: params[:price],
      )
    image = Image.create(
        image: params[:image],
        product_id: @product.id
      )
    redirect_to "index.html.erb"
  end
  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end
  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end
  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.name = params[:name]
    product.description = params[:description]
    product.price = params[:price]
    product.save
    redirect_to "index.html.erb"
  end
  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    redirect_to "index.html.erb"
  end
end
