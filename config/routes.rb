OnesZerosProject::Application.routes.draw do
  
  devise_for :users,
  				:controllers => {:registrations => "custom_devise/registrations"}
  resources :articles



  root "static_pages#home"
  get '/about', to: "static_pages#about" 


  get '/submit_article', to: "articles#new"
end
