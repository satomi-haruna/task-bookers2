Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'homes/top'
  root to: "homes#top"
  devise_for :users

  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  resources :books,only:[:new,:create,:index,:show,:destroy,:edit,:update]
  # get 'users/show'
  # get 'users/edit'
  resources :users,only:[:show,:edit,:update]

  get "homes/about" => "homes#about",as:'about'

end
