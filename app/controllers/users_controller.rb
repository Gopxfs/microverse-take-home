class UsersController < ApplicationController
  def index
  end

  def show
    @name = "James"
  end

  def get_users
    LoadUsersJob.perform_later
    redirect_to root_path
  end
end
