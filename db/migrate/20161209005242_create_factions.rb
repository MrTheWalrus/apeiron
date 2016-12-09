class CreateFactions < ActiveRecord::Migration
  def change
    create_table :factions do |t|
      t.text :name
      t.string :fleet
      t.string :territory
      t.text :notes

      t.timestamps
    end
  end
end
