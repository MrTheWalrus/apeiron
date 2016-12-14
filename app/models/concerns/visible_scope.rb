module VisibleScope
  extend ActiveSupport::Concern

  included do
    scope :visible, -> { where("status != 'hidden'") }
  end
end