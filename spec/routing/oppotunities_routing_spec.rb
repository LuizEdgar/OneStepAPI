require "rails_helper"

RSpec.describe OppotunitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/oppotunities").to route_to("oppotunities#index")
    end

    it "routes to #new" do
      expect(:get => "/oppotunities/new").to route_to("oppotunities#new")
    end

    it "routes to #show" do
      expect(:get => "/oppotunities/1").to route_to("oppotunities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/oppotunities/1/edit").to route_to("oppotunities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/oppotunities").to route_to("oppotunities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/oppotunities/1").to route_to("oppotunities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/oppotunities/1").to route_to("oppotunities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/oppotunities/1").to route_to("oppotunities#destroy", :id => "1")
    end

  end
end
