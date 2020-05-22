Rails.application.routes.draw do
  resources :teams
  resources :pokemons do
    resources :trainers do
      resources :teams
    end
  end    

  resources :trainers do
    resources :pokemons do
      resources :teams
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
