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
    get '/customers/:id/post_all', to: 'customers#post_all', as: 'customers_post_all'
    get '/customer/:id/post_comment_all', to: 'customers#post_comment_all', as: 'customers_post_comment_all'
    get '/customers/:id/post_search', to: 'customers#post_search', as: 'customers_post_search'
    resources :posts do
      resources :post_comments, only: %i[edit update create destroy]
    end
    get '/word_search', to: 'posts#word_search'
    get '/tag_search', to: 'posts#tag_search'
    get '/posts/category_search/:id', to: 'posts#category_search', as: 'posts_category_search'
    resources :notifications, only: %i[index]
    delete '/notifications', to: 'notifications#destroy_all', as: 'notifications_destroy_all'
    resources :contacts, only: %i[new create]
    post '/contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post '/contacts/back', to: 'contacts#back', as: 'back'
    get '/contacts/complete', to: 'contacts#complete', as: 'complete'
  end
end
