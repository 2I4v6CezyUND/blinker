require 'rails_helper'

RSpec.describe "Makes", type: :request do
  let!(:ford) { FactoryBot.create(:make, name: "Ford")}
  let(:ford_json){ JSON.parse(ford.to_json) }

  describe "GET /makes" do
    it "should return a list of makes" do
      get makes_path
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /makes/:id" do
    it "should the make at :id" do
      get make_path(1)
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json).to include({"name" => "Ford"})
    end
  end

  describe "POST /makes" do
    it "should create a new make" do
      post makes_path, params: {make: {name: "Nissan"}}
      expect(response).to have_http_status(201) 
      
      expect(Make.where({name: "Nissan"}).first).to be_truthy 
    end
    it "should validate  name" do
      post makes_path, params: {make: { stuff: "things"}}
      expect(response).to have_http_status(422)
    end
  end

  describe "PUT /makes" do
    it "should update the name" do
      supermake = FactoryBot.create(:make, name: "Supermake")
      put make_path(supermake.id), params: {make: {name: "NotSuperMake"}}
      expect(response).to have_http_status(200)
      expect(Make.where({name: "NotSuperMake"}).first).to be_truthy
    end
  end

  describe "DELETE /makes" do
    it "should delete the make" do
      delete make_path(1)
      expect(response).to have_http_status(204)
      expect(Make.where({name: "Ford"}).first).to_not be_truthy
    end
  end
end
