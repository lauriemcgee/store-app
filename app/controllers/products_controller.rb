class ProductsController < ApplicationController
  def index
    if session[:count] == nil
       session[:count] = 0
    end
    
    session[:count] +=1
    @page_count = session[:count]
    
    if 
        params[:form_name]
        @products = Products.where("name LIKE ?", "%" + params[:form_name] + "%")
      elsif 
        params[:discounted] == "true"
        @products = Product.where("price < ?", 10)
      elsif 
        params[:category]
        category = Category.find_by(name: params[:category])
        @products = category.products
      else
        sort_attribute = params[:sort_by] || "name"
        sort_attribute_order = params[:sort_order] || "asc"
        @products = Product.all.order(sort_attribute => sort_attribute_order)
    end
    
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
    @product_id = params[:id]
    @product = Product.find_by(id: @product_id)
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
