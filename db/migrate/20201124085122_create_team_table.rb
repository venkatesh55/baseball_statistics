class CreateTeamTable < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :division_id
      t.string :city
      t.string :name
    end
  end
end
