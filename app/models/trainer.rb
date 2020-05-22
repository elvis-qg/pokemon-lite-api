class Trainer < ApplicationRecord
  validates :name, :gender, presence: true
  validates :status_active, inclusion: { in: [true, false] }
  validates :name, uniqueness: true
  validates :wins, :losses, numericality: { greater_than_or_equal_to: 0 }

  has_many :teams, dependent: :destroy
  has_many :pokemons, through: :teams
end
