class Public::NotificationsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @notifications = current_customer.passive_notifications.page(params[:page]).per(10)
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end

  def destroy_all
    # 通知を全削除
    @notifications = current_customer.passive_notifications.destroy_all
    redirect_to public_notifications_path
  end
end
