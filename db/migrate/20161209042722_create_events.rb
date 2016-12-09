class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :name
      t.text :description
      t.text :action
      t.text :resolution
      t.string :status

      t.timestamps
    end
  end
end
