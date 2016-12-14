class MissionsController < ApplicationController
  layout false

  def index
    @missions = Mission.visible.all
  end

end
