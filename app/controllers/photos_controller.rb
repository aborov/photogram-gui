class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order({ :created_at => :desc })
    render({ :template => "photos_templates/index" })
  end

  def create
    p = Photo.new
    p.image = params.fetch("input_image")
    p.caption = params.fetch("input_caption")
    p.owner_id = params.fetch("input_owner_id")
    p.save

    @the_photo = Photo.where({ :image => params.fetch("input_image") }).first

    redirect_to "/photos/#{@the_photo.id}"
  end

  def show
    @the_photo = Photo.where({ :id => params.fetch("path_id") }).first

    if @the_photo == nil
      redirect_to "/photos"
    else
      render({ :template => "photos_templates/show" })
    end
  end

  def update
    f = Photo.where({ :id => params.fetch("path_id") }).first
    f.image = params.fetch("input_image")
    f.caption = params.fetch("input_caption")
    f.save

    @the_photo = Photo.where({ :id => params.fetch("path_id") }).first

    redirect_to "/photos/#{@the_photo.id}"
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
