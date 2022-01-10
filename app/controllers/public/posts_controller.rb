class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to public_post_path(@post.id)
      flash[:success] = "投稿しました"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @customer = Customer.find(@post.customer_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
     if @post.update(post_params)
       redirect_to public_post_path(@post.id)
       flash[:success] = "投稿内容を変更しました"
     else
       render :edit
     end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_customer_path(@post.id)
    flash[:danger] = "投稿を削除しました"
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image, :category_id)
  end

end
