OnesZerosProject::Application.routes.draw do

  devise_for :users,
  				:controllers => {:registrations => "custom_devise/registrations"}
  resources :articles



  root "static_pages#home"
  get '/about', to: "static_pages#about"
  get '/submit_article', to: "articles#new"
  post '/spec', to: "static_pages#spec_rec"
  get '/refresh', to: "static_pages#refresh"
   
 end
