class AdminController < ApplicationController
  def index
    @resources = Resource.all
    @projects = Project.includes(:mission).order(:id).all
    @missions = Mission.order(:number).all
    @factions = Faction.by_power.all
    @events = Event.all
  end
end
