class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
    @posts = @customer.posts
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
