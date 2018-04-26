require 'rails_helper'

RSpec.describe "ModelVariants", type: :request do
  describe "GET /model_variants" do
    it "works! (now write some real specs)" do
      get model_variants_path
      expect(response).to have_http_status(200)
    end
  end
end
