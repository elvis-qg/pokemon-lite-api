require 'csv'

def insert_data
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

    t = Trainer.find_or_create_by!(trainer)
    p = Pokemon.find_or_create_by!(pokemon)
    
    Team.create!({ trainer_id: t.id, pokemon_id: p.id })
  end
end

insert_data
