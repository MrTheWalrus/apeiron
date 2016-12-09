class IntelController < ApplicationController
  layout false

  def home
    @factions = Faction.all
    @events = Event.all
  end
end
