class ProjectsController < ApplicationController
  layout false

  def index
    @resources = Resource.order('id').all
    @projects = Project.unlocked.order('approved_at desc').all
  end

  def create
    @project = Project.new(project_params)
    @project.save!
    redirect_to admin_index_path
  end

  def show
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to admin_index_path
  end

  private

  def project_params
    params.require(:project).permit!
  end


end
