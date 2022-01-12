class Public::HomesController < ApplicationController
  def top
    @posts = Post.all.limit(8).reverse_order
    @customers = Customer.all
    @categorys = Category.all
  end

  def about; end
end
