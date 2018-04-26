require "rails_helper"

RSpec.describe ModelVariantsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/model_variants").to route_to("model_variants#index")
    end


    it "routes to #show" do
      expect(:get => "/model_variants/1").to route_to("model_variants#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/model_variants").to route_to("model_variants#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/model_variants/1").to route_to("model_variants#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/model_variants/1").to route_to("model_variants#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/model_variants/1").to route_to("model_variants#destroy", :id => "1")
    end

  end
end
