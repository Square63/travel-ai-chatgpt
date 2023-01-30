Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"

  get "show", to: "home#show"
  post "generate_plan", to: "home#generate_plan"
  get "generate_plan", to: "home#index"
  get "explain_point", to: "home#explain_point"
end
