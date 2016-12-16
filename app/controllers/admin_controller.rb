class AdminController < ApplicationController
  def index
    @resources = Resource.all
    @projects = Project.includes(:mission).order(:id).all
    @missions = Mission.order(:number).all
    @factions = Faction.all
    @events = Event.all
  end
end
