Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/edit'

  root 'links#index'

  resources :links, except: :index do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

   get '/comments' => 'comments#index'

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create]
end
