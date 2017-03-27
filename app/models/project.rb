class Project < ActiveRecord::Base
  include VisibleScope

  STATUSES = ['hidden', 'pending', 'approved', 'complete', 'rejected']

  belongs_to :mission

  validates :status, in: STATUSES

  scope :unlocked, -> { joins('left join missions on projects.mission_id = missions.id').where("projects.mission_id is null OR missions.status like ?", 'complete') }
end
