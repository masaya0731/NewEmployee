class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:show]

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.order(id: "DESC")
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer.id)
      flash[:success] = "プロフィールを変更しました"
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image, :email, :password)
  end
end
