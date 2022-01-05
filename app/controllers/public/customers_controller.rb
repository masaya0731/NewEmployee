class Public::CustomersController < ApplicationController

  private
  def customer_params
    params.require(:customer).permit(:name, :introduction, :plofile_image, :password, :email)
  end
end
