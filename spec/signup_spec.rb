require "spec_helper"

RSpec.describe Signup do
  def app
    Signup # this defines the active application for this test
  end

  describe "POST" do 
    context "submitting a valid form" do      
      it "returns 201 OK" do
        params = { email: "post@diddy.com", name: "Post Diddy" } 
        post "/", params

        expect(last_response.body).to eq ""
        expect(last_response.status).to eq 201
      end
    end

    context "invalid form" do
      it "doesn't work if you ignore email" do
        params = { email: "", name: "Post Diddy" } 
        post "/", params

        expect(last_response.body).to eq ""
        expect(last_response.status).to eq 500
      end
    end

  end

end

