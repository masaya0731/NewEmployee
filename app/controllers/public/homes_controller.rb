class Public::HomesController < ApplicationController
  def top
    @posts = Post.all.limit(8).reverse_order
    @customers = Customer.all
    @categorys = Category.all
    @tag_list = Tag.all
  end

  def about; end
end
