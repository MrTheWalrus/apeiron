class Project < ActiveRecord::Base
  #TODO: Validate status
  STATUSES = ['pending', 'approved', 'complete']
end
