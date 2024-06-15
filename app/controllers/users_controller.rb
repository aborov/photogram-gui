class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({ :username => :asc })
    render({ :template => "user_templates/index" })
  end

  def create
    u = User.new
    u.username = params.fetch("input_username")
    u.save
    redirect_to "/users"
  end

  def show
    @the_user = User.where({ :username => params.fetch("path_username") }).first

    if @the_user == nil
      redirect to("/users")
    else
      render({ :template => "user_templates/show" })
    end
  end
end
