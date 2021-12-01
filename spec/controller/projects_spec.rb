
require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end
  
  login_user

  let(:valid_attributes) {
      { :title => "Test title!", :description => "This is a test description", :status => "draft" }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
      it "returns a success response" do
          Article.create! valid_attributes
          get :index, params: {}, session: valid_session

          # Make sure to swap this as well
          expect(response).to be_successful # be_successful expects a HTTP Status code of 200
          # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
      end
    end
  end
  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end
end

