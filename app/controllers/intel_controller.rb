class IntelController < ApplicationController
  def home
    @factions = Faction.all
  end
end
