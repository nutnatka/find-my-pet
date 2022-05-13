Rails.application.routes.draw do
  scope "(:locale)", locale: /en|uk/ do
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users, only: [:show] do
      resources :pets
    end
    root 'welcome#index'
    match '/users/:id', to: 'users#show', via: 'get'
    get 'users', to: 'welcome#index'
  end
end
