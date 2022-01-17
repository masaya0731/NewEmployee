module Public::NotificationsHelper

  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    @visitor_comment = notification.post_comment_id
    #notification.actionがfollowかlikeかcommentか
    case notification.action
      when "post_comment" then
        @comment = PostComment.find_by(id: @visitor_post_comment)&.content
        tag.a(@visitor.name, href:public_customer_path(@visitor), style:"font-weight: bold;")+"さんが"+tag.a('あなたの投稿', href:public_post_path(notification.post_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
     # 通知の確認
    @notifications = current_customer.passive_notifications.where(checked: false)
  end
end
