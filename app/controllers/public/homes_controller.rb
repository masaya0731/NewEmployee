class Public::HomesController < ApplicationController
  def top
    @posts = Post.all.order(id: 'DESC')
    @customers = Customer.all
    @categorys = Category.all
  end

  def about; end
end
