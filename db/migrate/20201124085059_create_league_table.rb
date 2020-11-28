class CreateLeagueTable < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.integer :season_id
      t.string :name
    end
  end
end
