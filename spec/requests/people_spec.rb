require 'rails_helper'

RSpec.describe "People API", type: :request do
  let!(:people) { create_list(:person, 10) }
  let!(:person) { create(:person) }

  describe "GET /people" do
    before { get '/people', as: :json }

    it "returns people" do
      response_body = JSON.parse(response.body)
      expect(response_body).not_to be_empty
      expect(response_body.size).to eq(11)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /people/:id" do
    before { get "/people/#{person.id}", as: :json }

    context "when the record exists" do
      it "returns the person" do
        response_body = JSON.parse(response.body)
        
        expect(response_body["id"]).to eq(person.id)
        expect(response_body["name"]).to eq(person.name)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      before { get "/people/999", as: :json }

      it "returns a not found message" do
        response_body = JSON.parse(response.body)
        expect(response_body["error"]).to eq("Not Found")
      end

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
    end
  end

end