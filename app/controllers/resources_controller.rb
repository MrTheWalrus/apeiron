class ResourcesController < ApplicationController
  layout false

  def index
    @resources = Resource.all
  end

  def update
    @resource = Resource.find(params[:id])
    @resource.update(resource_params)
    redirect_to admin_index_path
  end

  private

  def resource_params
    params.require(:resource).permit!
  end


end