class TeamsController < ApplicationController
  def index
    @team = Team.find(params[:id])
  end

  def create
  end

  def edit
    @team = Team.find(params[:id])
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
  end
end
