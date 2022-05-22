Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users, only: [:show] do
      resources :pets
    end

    resources :posts

    root 'welcome#index'
    match '/users/:id', to: 'users#show', via: 'get'
    get 'users', to: 'welcome#index'
    post 'posts#index', to: 'posts#new', as: 'new_posts_post'
  end
end
