class MissionsController < ApplicationController
  layout false

  def index
    @missions = Mission.visible.all
  end

  def update
    @mission = Mission.find(params[:id])
    @mission.update(mission_params)
    redirect_to admin_index_path
  end

  private

  def mission_params
    params.require(:mission).permit!
  end

end
