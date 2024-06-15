class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })
    render({ :template => "photos_templates/index" })
  end

def create
  
end

  def show
    @the_photo = Photo.where({ :id => params.fetch("path_id") }).first

    if @the_photo == nil
      redirect_to "/photos"
    else
      render({ :template => "photos_templates/show" })
    end
  end

  def delete
    the_photo = Photo.where({ :id => params.fetch("path_id") }).first

    # if the_photo.comments != nil
    #   the_photo.comments.destroy
    # end
    # if the_photo.likes != nil
    #   the_photo.likes.destroy
    # end

    the_photo.destroy
    # render({ :template => "photos_templates/index" })
    redirect_to "/photos"
  end
end
