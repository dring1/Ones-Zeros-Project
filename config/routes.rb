OnesZerosProject::Application.routes.draw do
  
  devise_for :users
  resources :articles

  root "static_pages#home"
  get '/about', to:"static_pages#about" 


  get '/submit_article', to: "articles#new", as: :submit_article
end
