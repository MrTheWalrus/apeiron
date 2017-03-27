class Event < ActiveRecord::Base
  include VisibleScope

  STATUSES = ['hidden', 'available', 'ignored', 'active', 'resolved']

  validates :status, inclusion: { in: STATUSES }

end
