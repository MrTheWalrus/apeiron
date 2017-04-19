class Mission < ActiveRecord::Base
  include VisibleScope

  STATUSES = ['hidden', 'available', 'active', 'complete']

  has_many :projects

  validates :status, inclusion: { in: STATUSES }
end
