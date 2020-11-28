class CreatePlayerTable < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :surname
      t.string :given_name
      t.string :throws
      t.string :position
      t.integer :wins
      t.integer :losses
      t.integer :saves
      t.integer :games
      t.integer :games_started
      t.integer :complete_games
      t.integer :shut_outs
      t.float :era
      t.float :innings
      t.integer :at_bats, default: 0
      t.integer :runs
      t.integer :earned_runs
      t.integer :hit_batter
      t.integer :wild_pitches
      t.integer :balk
      t.integer :walked_batter
      t.integer :struck_out_batter
      t.integer :hits, default: 0
      t.integer :doubles, default: 0
      t.integer :triples, default: 0
      t.integer :home_runs, default: 0
      t.integer :rbi
      t.integer :steals
      t.integer :caught_stealing
      t.integer :sacrifice_hits
      t.integer :sacrifice_flies, default: 0
      t.integer :errors_count
      t.integer :pb
      t.integer :walks, default: 0
      t.integer :struck_out
      t.integer :hit_by_pitch, default: 0
      t.float :ops, default: 0
      t.float :avg, default: 0
      t.integer :sb, default: 0
    end
  end
end
