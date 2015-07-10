Rails.application.routes.draw do

  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'login' => 'users#new'
  get 'catalog' => 'books#index'
  get 'donate' => 'books#new'
end
