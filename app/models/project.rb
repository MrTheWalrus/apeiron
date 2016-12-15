class Project < ActiveRecord::Base
  include VisibleScope

  STATUSES = ['pending', 'approved', 'complete']

  belongs_to :mission

  scope :unlocked, -> { joins('left join missions on projects.mission_id = missions.id').where("projects.mission_id is null OR missions.status like ?", 'complete') }
end
