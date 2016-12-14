class IntelController < ApplicationController
  layout false

  def home
    @factions = Faction.all
    @events = Event.visible.all
  end
end
