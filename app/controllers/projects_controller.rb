class ProjectsController < ApplicationController
  layout false

  def index
    @resources = Resource.order('id').all
    @projects = Project.unlocked.order('approved_at desc').all
  end

  def show
  end

end
