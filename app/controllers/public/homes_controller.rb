class Public::HomesController < ApplicationController

  def top
    @posts = Post.all
    @customers = Customer.all
    @categorys = Category.all
  end

  def about
  end

end
