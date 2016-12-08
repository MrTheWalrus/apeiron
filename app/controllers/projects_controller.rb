class ProjectsController < ApplicationController
  layout false
  # For now, maybe this is it?
  def index
    @resources = Resource.order('id').all
    @projects = Project.order('approved_at desc').all
  end

  def show
  end

end
