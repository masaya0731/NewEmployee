class Public::HomesController < ApplicationController

  def top
    @post = Post.where(params[:id])
    @posts = Post.all
    @customers = Customer.all
    @categorys = Category.all
  end

  def about
  end

end
