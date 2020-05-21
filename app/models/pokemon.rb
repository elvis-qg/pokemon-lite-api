class Pokemon < ApplicationRecord
  has_many :teams
  has_many :trainers, through: :teams
end
