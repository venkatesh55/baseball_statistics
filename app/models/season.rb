class Season < ApplicationRecord
  has_many :leagues
  has_many :league_participations
  has_many :players, through: :league_participations
end