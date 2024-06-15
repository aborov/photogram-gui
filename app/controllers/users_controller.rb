class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order({ :username => :asc })
    render({ :template => "user_templates/index" })
  end

  def show

    #   Parameters: {"path_username"=>"austin"}
    @the_user = User.where({ :username => params.fetch("path_username") }).first

    if @the_user == nil
      redirect to("/users")
    else
      render({ :template => "user_templates/show" })
    end
  end
end
