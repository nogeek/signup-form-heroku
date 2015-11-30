require "spec_helper"

RSpec.describe Health do
  def app
    Health # this defines the active application for this test
  end
  
  describe "GET health" do 
    context "system up" do      
      it "returns 200 OK" do
        get "/"

        expect(last_response.status).to eq 200
      end

      it "returns empty body" do
        get "/"
        
        expect(last_response.body).to eq("")
      end
    end
  end
end
