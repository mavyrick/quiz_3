Rails.application.routes.draw do
  get 'ideas/index'

  get 'ideas/new'

  get 'ideas/edit'

  get 'ideas/show'

  root 'ideas#index'

  resources :ideas do
    resources :likes, only: [:create, :destroy]
    resources :joins, only: [:create, :destroy]
    resources :comments
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
