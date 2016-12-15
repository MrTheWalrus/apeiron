class Project < ActiveRecord::Base
  include VisibleScope

  STATUSES = ['pending', 'approved', 'complete']

  belongs_to :mission

  scope :unlocked, -> { joins('left join missions on mission_id = missions.id').where("mission_id is null or missions.status == 'complete'") }
end
