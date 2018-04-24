require 'rails_helper'

RSpec.describe "Makes", type: :request do
  describe "GET /makes" do
    it "works! (now write some real specs)" do
      get makes_path
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json[0]).to include({"name" => "Ford"})
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
    it "should be bad if not name provided" do
      post makes_path, params: {make: { stuff: "things"}}
      expect(response).to have_http_status(422)
    end
  end
end
