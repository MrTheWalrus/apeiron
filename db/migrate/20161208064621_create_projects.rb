class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :name
      t.text :proposer
      t.text :description
      t.text :resources
      t.datetime :approved_at
      t.string :status
      t.string :text

      t.timestamps
    end
  end
end
