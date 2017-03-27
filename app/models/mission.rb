class Mission < ActiveRecord::Base
  include VisibleScope

  STATUSES = ['hidden', 'active', 'complete']

  has_many :projects

  validates :status, inclusion: { in: STATUSES }
end
