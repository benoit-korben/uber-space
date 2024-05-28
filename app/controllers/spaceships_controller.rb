class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show]

  def index
  end

  def show; end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end
end
