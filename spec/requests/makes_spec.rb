require 'rails_helper'

RSpec.describe "Makes", type: :request do
  describe "GET /makes" do
    it "works! (now write some real specs)" do
      get makes_path
      json = JSON.parse(response.body)
      expect(json[0]).to include({"name" => "Ford"})
      expect(response).to have_http_status(200)
    end
  end
end
