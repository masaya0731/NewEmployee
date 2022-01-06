class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image)
  end
end
