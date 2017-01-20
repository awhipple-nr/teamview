require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { create(:team) }
  let(:team_with_invalid_name) { build(:team, name: "") }
  let(:team_with_invalid_andon) { build(:team, andon: "") }
  let(:team_with_invalid_email) { build(:team, email: "user@somewhere.com") }


   it { is_expected.to validate_presence_of(:name) }
   it { is_expected.to validate_presence_of(:andon) }

   describe "attribute test" do

      it "has attributes" do

       expect(team).to have_attributes(
        name: team.name,
        members: team.members,
        email: team.email,
        slack_channel: team.slack_channel,
        andon: team.andon,
        jira_project_key: team.jira_project_key,
        accounting_code: team.accounting_code,
        charter: team.charter,
        responsibilities: team.responsibilities,
        vision: team.vision,
        mission: team.mission,
        mission_tests: team.mission_tests,
        success_criteria: team.success_criteria
        )
     end
   end

   describe "invalid team" do

     it "should be an invalid team due to blank name" do
       expect(team_with_invalid_name).to_not be_valid
     end

     it "should be an invalid team due to invalid andon" do
       expect(team_with_invalid_andon).to_not be_valid
     end

     it "should be an invalid team due to invalid email" do
       expect(team_with_invalid_email).to_not be_valid
     end

   end
end
