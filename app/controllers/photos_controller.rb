class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })
    render({ :template => "photos_templates/index" })
  end

  def show
    @the_photo = Photo.where({ :id => params.fetch("path_id") }).first

    if @the_photo == nil
      redirect to("/photos")
    else
      render({ :template => "photos_templates/show" })
    end
  end
end
