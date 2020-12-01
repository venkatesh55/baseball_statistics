class LeagueParticipation < ApplicationRecord
  belongs_to :player
  belongs_to :team
  belongs_to :league
  belongs_to :season
end