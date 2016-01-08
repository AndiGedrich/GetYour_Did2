class StaticPagesController < ApplicationController
  def home
  end

  def about
  end


#this is to create the multi-facited filter in the form partial to first have the category selected
#then display the associated services for that category for selection.
#this should then pass the service id to the appointments partial to display appointments available in that type

  def update_services
    @services = Service.where("category_id = ?", params[:category_id])
    respond_to do |format|
      format.js
    end
  end
end
