class UsersController < ApplicationController
  def index
    @users = User.limit(limit).offset(params[:offset]).where(status)

    respond_to do |format|
      format.html { render json: @users }
      format.json { render json: @users }
    end
  end

  def show
    @name = "James"
  end

  def get_users
    LoadUsersJob.perform_later
    redirect_to root_path
  end

  private

  def limit
    [params.fetch(:limit, 7).to_i, 100].min
  end

  def status
    { status: params[:status] } if params[:status].present?
  end
end
