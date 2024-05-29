class DashboardsController < ApplicationController
  def index
    if current_user
      @spaceships = Spaceship.where(user_id: current_user.id)
    else
      @spaceships = Spaceship.all
      # render partial: 'spaceships/index', locals: { spaceships: @spaceships }
    end
  end

  def show
  end

end
