require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let(:my_team) { create(:team) }

   describe "GET index" do
     it "assigns team to @teams" do
       get :index

       expect(assigns(:teams)).to eq([my_team])
     end
   end

   describe "GET show" do
     it "returns http success" do
       get :show, {id: my_team.id}

       expect(response).to have_http_status(:success)
     end

     it "renders the #show view" do
       get :show, {id: my_team.id}

       expect(response).to render_template :show
     end

     it "assigns team to @team" do
       get :show, {id: my_team.id}

       expect(assigns(:team)).to eq(my_team)
     end
   end

   describe "GET new" do
      it "returns http success" do
        get :new

        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new

        expect(response).to render_template :new
      end

      it "instantiates @team" do
        get :new

        expect(assigns(:team)).not_to be_nil
      end
    end

    describe "Team create" do
      let(:team) { build(:team) }
      it "increases the number of Teams by 1" do

        expect{post :create, team: {name: team.name, andon: team.andon}}.to change(Team, :count).by(1)
      end

      it "assigns the new team to @team" do
        post :create, team: {name: team.name, andon: team.andon}

        expect(assigns(:team)).to eq Team.last
      end

      it "redirects to the new team" do
        post :create, team: {name: team.name, andon: team.andon}

        expect(response).to redirect_to Team.last
      end
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, {id: my_team.id}

        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, {id: my_team.id}

        expect(response).to render_template :edit
      end

      it "assigns team to be updated to @team" do
        get :edit, {id: my_team.id}
        team_instance = assigns(:team)

        expect(team_instance.id).to eq my_team.id
        expect(team_instance.name).to eq my_team.name
        expect(team_instance.andon).to eq my_team.andon
      end
    end

    describe "PUT update" do
     it "updates team with expected attributes" do
       new_name = my_team.name
       new_andon = my_team.andon
       put :update, id: my_team.id, team: {name: new_name, andon: new_andon}
       updated_team = assigns(:team)

       expect(updated_team.id).to eq my_team.id
       expect(updated_team.name).to eq new_name
       expect(updated_team.andon).to eq new_andon
     end

     it "redirects to the updated team" do
       new_name = my_team.name
       new_andon = my_team.andon
       put :update, id: my_team.id, team: {name: new_name, andon: new_andon}

       expect(response).to redirect_to my_team
     end
   end

   describe "DELETE destroy" do
     it "deletes the team" do
       delete :destroy, {id: my_team.id}
       count = Team.where({id: my_team.id}).size

       expect(count).to eq 0
     end

     it "redirects to welcome index" do
       delete :destroy, {id: my_team.id}

       expect(response).to redirect_to root_path
     end
   end


 end
