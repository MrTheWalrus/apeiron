class Event < ActiveRecord::Base
  include VisibleScope

  STATUSES = ['hidden', 'available', 'ignored', 'active', 'resolved', 'failed']

  validates :status, inclusion: { in: STATUSES }

end
