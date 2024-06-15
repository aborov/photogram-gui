class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({ :username => :asc })
    render({ :template => "user_templates/index" })
  end

  def create
    u = User.new
    u.username = params.fetch("input_username")
    u.save

    @the_user = User.where({ :username => params.fetch("input_username") }).first
    
    redirect_to "/users/#{@the_user.username}"
  end

  def show
    @the_user = User.where({ :username => params.fetch("path_username") }).first

    if @the_user == nil
      redirect_to "/users"
    else
      render({ :template => "user_templates/show" })
    end
  end
end
