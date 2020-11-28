class CreateLeagueParticipationTable < ActiveRecord::Migration[5.2]
  def change
    create_table :league_participation do |t|
      t.integer :league_id
      t.integer :team_id
      t.integer :player_id
    end
  end
end
