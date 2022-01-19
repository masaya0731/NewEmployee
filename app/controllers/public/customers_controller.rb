class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: %i[show post_all]

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.limit(5).reverse_order
  end

  def post_all
    # ユーザーの過去の投稿一覧
    @customer = Customer.find(params[:id])
    if params[:sort_create]
      @posts = @customer.posts.all.page(params[:page]).per(20)
    else
      @posts = @customer.posts.all.page(params[:page]).per(20).reverse_order
    end
  end

  def edit
    @customer = Customer.find(params[:id])
    # ログインユーザーと検索したユーザーのIDが一致しなければマイページに遷移させる
    redirect_to public_customer_path(current_customer) unless @customer == current_customer
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer.id)
      flash[:success] = 'プロフィールを変更しました'
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image, :email, :password)
  end
end
