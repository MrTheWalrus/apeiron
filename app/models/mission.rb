class Mission < ActiveRecord::Base
  include VisibleScope

  STATUSES = ['hidden', 'active', 'complete']

  has_many :projects

  validates :status, in: STATUSES
end
