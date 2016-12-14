class Project < ActiveRecord::Base
  include VisibleScope
  #TODO: Validate status
  STATUSES = ['pending', 'approved', 'complete']
end
