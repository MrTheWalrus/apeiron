class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :number
      t.text :name
      t.text :brief
      t.text :resolution
      t.string :status

      t.timestamps
    end
  end
end
