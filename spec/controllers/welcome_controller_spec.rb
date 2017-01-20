require "rails_helper"

RSpec.describe WelcomeController, :type => :controller do
  describe "GET #index" do
    it "should render the index template" do
      get :index # localhost:3000
      expect(response).to render_template("index")
    end
  end


  describe "GET about" do
     it "renders the about template" do
       get :about
       expect(response).to render_template("about")
     end
   end
end
