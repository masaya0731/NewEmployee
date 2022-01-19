class Public::ContactsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to public_complete_path
    else
      render :new
    end
  end

  def complete; end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :title, :body)
  end
end
