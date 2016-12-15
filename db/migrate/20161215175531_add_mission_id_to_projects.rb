class AddMissionIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :mission_id, :integer
  end
end
