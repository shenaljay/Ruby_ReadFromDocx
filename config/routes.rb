Rails.application.routes.draw do
  post 'new', to: 'files#new'
  get 'files/new'
  root 'files#new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
#Shenal Madurawalage Don - S1498742
#Q3S1498742