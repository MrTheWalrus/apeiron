class Faction < ActiveRecord::Base
  scope :by_power, -> { order('fleet::int desc') }

end
