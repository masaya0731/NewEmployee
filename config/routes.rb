Rails.application.routes.draw do
  # 管理者用
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about'

  namespace :public do
    resources :customers, only: %i[show edit update]
    # ユーザーの過去の投稿一覧画面
    get '/customers/:id/post_all', to: 'customers#post_all', as: 'customers_post_all'
    # ユーザーのコメントをした投稿一覧画面
    get '/customer/:id/post_comment_all', to: 'customers#post_comment_all', as: 'customers_post_comment_all'
    # ユーザーの過去の投稿一覧画面での検索結果表示画面
    get '/customers/:id/post_search', to: 'customers#post_search', as: 'customers_post_search'
    resources :posts do
      resources :post_comments, only: %i[edit update create destroy]
    end
    # 検索フォームでの検索結果表示画面
    get '/word_search', to: 'posts#word_search'
    # タグ別表示画面
    get '/tag_search', to: 'posts#tag_search'
    # カテゴリー別表示画面
    get '/posts/category_search/:id', to: 'posts#category_search', as: 'posts_category_search'
    # 通知一覧画面
    resources :notifications, only: %i[index]
    # 通知全削除
    delete '/notifications', to: 'notifications#destroy_all', as: 'notifications_destroy_all'
    # お問い合わせ
    resources :contacts, only: %i[new create]
    # お問い合わせ内容確認画面
    post '/contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    # お問い合わせ確認画面から入力内容をそのままにしてフォームに戻す
    post '/contacts/back', to: 'contacts#back', as: 'back'
    # お問い合わせ完了画面
    get '/contacts/complete', to: 'contacts#complete', as: 'complete'
  end
end
