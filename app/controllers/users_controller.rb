class UsersController < ApplicationController
  def new
    render "new.html.erb"
  end
  def create
    user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[password_confirmation]
      )
    user.save
    
  end
end
end
