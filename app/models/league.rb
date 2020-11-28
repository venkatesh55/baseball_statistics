class League < ApplicationRecord
  has_many :divisions
  belongs_to :season
  has_many :players, through: :league_participations
end