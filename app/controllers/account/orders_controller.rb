class Account::OrdersController < ApplicationController
  def index
  #  binding.pry
    @orders = Order.where(:poster_user_id => current_user)
  end

end
