Rails.application.routes.draw do
  devise_for :users, path_prefix: 'd', controllers: { registrations: 'users/registrations' }
  resources :users, only:[:show]
  root 'welcome#index'
  match '/users/:id',     to: 'users#show',       via: 'get'
  match '/pets/create',     to: 'pets#create',       via: 'get'
  match '/pets/create',     to: 'pets#create',       via: 'post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
