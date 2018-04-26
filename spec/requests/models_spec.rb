require 'rails_helper'

RSpec.describe "Makes", type: :request do
  let(:ford) { FactoryBot.create(:make, name: "Ford")}
  let!(:f150) { FactoryBot.create(:model, name: "F150", make: ford)}

  describe "GET /makes" do
    xit "should return a list of makes" do
      get makes_path
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json).to include(ford_json)
    end
  end

  describe "GET /models/:id" do
    it "should the model at :id" do
      get model_path(f150.id)
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json).to include({"name" => "F150", "make_id" => ford.id})
    end
  end

  describe "POST /models" do
    it "should create a new model" do
      post models_path, params: {model: {name: "F250", make_id: ford.id}}
      expect(response).to have_http_status(201) 
      
      expect(Model.where({name: "F250"}).first).to be_truthy 
    end
    it "should validate name" do
      post models_path, params: {model: { stuff: "things"}}
      expect(response).to have_http_status(422)
    end
  end

  describe "PUT /models" do
    it "should update the name" do
      supermodel = FactoryBot.create(:model, name: "SuperModel", make: ford)
      put model_path(supermodel.id), params: {model: {name: "NotSuperModel"}}
      expect(response).to have_http_status(200)
      expect(Model.where({name: "NotSuperModel"}).first).to be_truthy
    end
  end

  describe "DELETE /models" do
    it "should delete the model" do
      delete model_path(1)
      expect(response).to have_http_status(204)
      expect(Model.where({name: "F150"}).first).to_not be_truthy
    end
  end
end
