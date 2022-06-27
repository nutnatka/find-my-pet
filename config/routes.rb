Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users, only: :show do
      get 'posts', action: :user_posts, controller: 'posts', as: 'posts'
    end

    resources :pets do
      member do
        post :find
        post :find_master
        post :adopt_pet
      end
    end

    resources :posts

    root 'welcome#index'
    get 'users', to: 'welcome#index'
    get 'welcome#index', to: 'posts#new', as: 'new_post_from_welcome'
  end
end
