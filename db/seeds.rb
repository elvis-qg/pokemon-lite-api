# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

def insert_data
  conn = PG.connect( dbname: 'pokemon_lite_api_development' )
  
  CSV.foreach("pokemon-lite-api.csv", headers: true) do |row|
    trainer = { 
      name: row['t_name'],
      gender: row['t_gender'],
      home_region: row['t_region'],
      status_active: row['t_team_member'],
      wins: row['wins'],
      losses: row['losses'],
    }

    pokemon = {
      name: row['name'],
      base_experience: row['base_exp'],
      main_type: row['main_type'],
      main_ability: row['main_ability'],
    }

    t = Trainer.create!(trainer)
    p = Pokemon.create!(pokemon)

    team = {
      trainer_id: t.id,
      pokemon_id: p.id,
    }

    Team.create!(team)
  end
end

# fields_pokemon = ["name", "base_exp", "main_type", "main_ability"]
insert_data
