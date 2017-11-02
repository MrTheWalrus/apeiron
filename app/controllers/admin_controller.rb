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
    @factions = Faction.order(:fleet).reverse
    @events = Event.all
  end

  def crisis
    Apeiron::Application.config.crisis = (params[:set]=='1')
    redirect_to admin_index_path
  end
end
