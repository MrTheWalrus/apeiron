class FactionsController < ApplicationController
  layout false

  def index
    @factions = Faction.all
  end

  def update
    @faction = Faction.find(params[:id])
    @faction.update(faction_params)
    redirect_to admin_index_path
  end

  private

  def faction_params
    params.require(:faction).permit!
  end

end