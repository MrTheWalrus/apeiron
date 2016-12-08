class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.text :name
      t.text :description
      t.decimal :quantity
      t.text :unit

      t.timestamps
    end
  end
end
