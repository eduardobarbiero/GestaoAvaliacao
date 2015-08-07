Rails.application.routes.draw do
  resources :candidatos

  resources :emails

  resources :respostas

  resources :respostas

  resources :conhecimentos

  resources :home

  devise_for :users, :skip => [:registrations]

  root to: 'home#index'

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
  end

  get '/avaliacao' => 'candidatos#avaliacao'

  get 'candidatos/thank_you'

  get 'home/index'
end
