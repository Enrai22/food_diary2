Rails.application.routes.draw do
  get '/' => "home#top"
  resources :posts
  resources :users

  post "follows/:user_id/create" => "follows#create"
  post "follows/:user_id/destroy" => "follows#destroy"

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  get "signup" => "users#new"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  get "users/:id/likes" => "users#likes"
  get "users/:id/follows" => "users#follows"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
