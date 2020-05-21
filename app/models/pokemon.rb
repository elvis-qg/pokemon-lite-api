class Pokemon < ApplicationRecord
  validates :name, :main_ability, :main_type, presence: true
  validates :main_type, inclusion: { in: %W(bug electric fairy fighting fire flying grass ground ice normal poison psychic rock steel water) }
  validates :name, uniqueness: true

  has_many :teams
  has_many :trainers, through: :teams
end
