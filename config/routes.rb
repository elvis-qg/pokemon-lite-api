Rails.application.routes.draw do
  resources :teams

  resources :trainers do
    resources :pokemons, only: [:index, :show]
  end

  resources :pokemons  do
    resources :trainers, only: [:index, :show]
  end
end
