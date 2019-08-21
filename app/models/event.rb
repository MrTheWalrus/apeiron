class Event < ApplicationRecord
  include VisibleScope

  STATUSES = ['hidden', 'available', 'ignored', 'active', 'resolved', 'failed']

  validates :status, inclusion: { in: STATUSES }

end
