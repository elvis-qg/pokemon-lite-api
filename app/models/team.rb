class Team < ApplicationRecord
  belongs_to :trainers
  belongs_to :pokemons
end
