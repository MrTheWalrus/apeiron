class HomeController < ApplicationController

  def index
    @crisis = Apeiron::Application.config.crisis
  end

end
