require 'rails_helper'

RSpec.describe Api::TeamsController, type: :controller do
  let(:my_team) { create(:team) }

    describe "GET #show" do
      before do
        get :show, id: my_team.id
      end

      it "returns http success" do

        expect(response).to have_http_status(:success)
      end

      it "responds with JSON body containing expected Team attributes" do

        expect(response.body).to look_like_json
        expect(body_as_json).to match({
          id: my_team.id,
          name: my_team.name,
          accounting_code: my_team.accounting_code,
          andon: my_team.andon,
          charter: my_team.charter,
          email: my_team.email,
          jira_project_key: my_team.jira_project_key,
          members: my_team.members,
          mission: my_team.mission,
          mission_tests: my_team.mission_tests,
          responsibilities: my_team.responsibilities,
          slack_channel: my_team.slack_channel,
          success_criteria: my_team.success_criteria,
          vision: my_team.vision,
          created_at: Time.zone.now.change(usec: 0)
        })
      end

      it "assigns team to @team" do
        get :show, {id: my_team.id}

        expect(assigns(:team)).to eq(my_team)
      end
    end

    describe "PUT update" do
      before do
        get :show, id: my_team.id
      end

      context "valid attributes" do
       it "updates team with expected attributes" do
         new_name = my_team.name
         new_andon = my_team.andon
         put :update, id: my_team, team: {name: new_name, andon: new_andon}
         updated_team = assigns(:team)

         expect(updated_team.id).to eq my_team.id
         expect(updated_team.name).to eq new_name
         expect(updated_team.andon).to eq new_andon
         expect(response.body).to look_like_json
       end
     end

     context "invalid attributes" do
       it "does not change team attributes" do
         put :update, id: my_team, team: {name: nil, andon: "green"}
         my_team.reload
         expect(my_team.name).not_to eq("MyString")
         expect(my_team.andon).to eq "green"
         expect(response.body).to look_like_json
       end
     end
   end


   describe "DELETE destroy" do
     it "deletes the team" do
       delete :destroy, {id: my_team.id}
       count = Team.where({id: my_team.id}).size

       expect(count).to eq 0
       expect(response.body).to look_like_json
     end
   end

end
