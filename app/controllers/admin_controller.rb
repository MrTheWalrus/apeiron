class AdminController < ApplicationController
  def index
    if session[:confirm_admin] || params[:confirm]
      session[:confirm_admin] = true
    else
      redirect_to root_path and return
    end
    @resources = Resource.all
    @projects = Project.includes(:mission).order(:id).all
    @missions = Mission.order(:number).all
    @factions = Faction.by_power.all
    @events = Event.all
  end
end
