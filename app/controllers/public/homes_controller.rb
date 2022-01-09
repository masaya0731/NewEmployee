class Public::HomesController < ApplicationController

  def top
    @posts = Post.all
    @customer = current_customer
  end

  def about
  end

end
