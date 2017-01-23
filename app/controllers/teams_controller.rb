class TeamsController < ApplicationController
  def index
    @teams = Team.all
    render :nothing => true
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    if @team.save
      flash[:notice] = "Team was saved successfully"
      redirect_to [@team]
    else
      flash.now[:alert] = "There was an error saving team info.  Please try again"
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
     @team = Team.find(params[:id])
     @team.assign_attributes(team_params)
       if @team.save
         flash[:notice] = "Team details updated."
         redirect_to [@team]
       else
         flash.now[:alert] = "There was an error updating team info. Please try again."
         render :edit
       end
   end

   def destroy
     @team = Team.find(params[:id])
       if @team.destroy
          flash[:notice] = "\"#{@team.name}\" was deleted successfully."
          redirect_to root_path
        else
          flash.now[:alert] = "There was an error deleting the post."
          render :show
        end
    end

  private

  def team_params
    params.require(:team).permit(:name, :andon, :members, :charter, :vision, :mission, :mission_tests,
      :success_criteria, :responsibilities, :accounting_code, :jira_project_key, :email, :slack_channel)
  end

end
