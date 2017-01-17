class Api::TeamsController < ApiController

  def index
    @teams = Team.all
    render json: @teams, each_serializer: TeamSerializer
  end

  def show
    @team = Team.find(params[:id])
    render json: @team, each_serializer: TeamSerializer
  end

  def create
     team = Team.new(team_params)
     if team.save
      render json: team
     else
      render json: { errors: team.errors.full_messages }, status: :unprocessable_entity
     end
   end

   def update
     puts JSON.pretty_generate params
     team = Team.find(params[:id])
     if team.update(team_params)
       render json: team
     else
       render :json => { :errors => team.errors.full_messages }
     end
   end

   def destroy
     begin
       team = Team.find(params[:id])
       team.destroy
       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

   private

   def team_params
     params.require(:team).permit(:name, :andon, :members, :charter, :vision, :mission, :mission_tests,
       :success_criteria, :responsibilities, :accounting_code, :jira_project_key, :email, :slack_channel)
   end

end
