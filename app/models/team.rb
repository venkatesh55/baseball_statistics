class Team < ApplicationRecord
  belongs_to :division
  has_many :league_participations
  has_many :players, through: :league_participations
end