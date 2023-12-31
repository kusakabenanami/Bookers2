Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"

  get "/home/about" => "homes#about"
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :create, :edit, :update, :index]

end