OnesZerosProject::Application.routes.draw do

  devise_for :users,
  				:controllers => {:registrations => "custom_devise/registrations"}
  resources :articles



  root "static_pages#home"
  get '/about', to: "static_pages#about"
  get '/submit_article', to: "articles#new"
  get '/refresh_spec', to: "static_pages#refresh_spec"
  get '/refresh', to: "static_pages#refresh"

 end
