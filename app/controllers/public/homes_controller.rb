class Public::HomesController < ApplicationController

  def top
    @posts = Post.all
    @customer = current_customer
    @categorys = Category.all
  end

  def about
  end

end
