class CommentsController < ApplicationController
  def create
    c = Comment.new
    c.photo_id = params.fetch("input_photo_id")
    c.author_id = params.fetch("input_author_id")
    c.body = params.fetch("input_comment")
    c.save

    @the_photo = Photo.where({ :id => params.fetch("input_photo_id") }).first

    redirect_to "/photos/#{@the_photo.id}"
  end
end
