class ChangeColumnPokemonsId < ActiveRecord::Migration[6.0]
  def change
    rename_column :teams, :pokemons_id, :pokemon_id
  end
end
