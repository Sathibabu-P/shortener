Rails.application.routes.draw do
  root  to: 'home#index', as: :home
  resources :links, only: :create
  get '/:short_code', to: "links#show"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
