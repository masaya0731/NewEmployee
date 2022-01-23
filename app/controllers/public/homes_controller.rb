class Public::HomesController < ApplicationController
  def top
    @post = Post.all
    @posts = Post.all.limit(10).reverse_order
    @customers = Customer.all
    @categorys = Category.all
  end

  def about; end
end
