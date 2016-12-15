class Mission < ActiveRecord::Base
  include VisibleScope

  has_many :projects
end
