require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "works! (now write some real specs)" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it "index - JSON 200 ok" do
      get '/customers.json'
      expect(response.body).to include_json(
        [
          id: 1,
          name: 'Darla Carroll',
          email: 'meu_email-1@email.com'
        ]
      )
    end

    it "show - JSON 200 ok" do
      get '/customers/1.json'
      expect(response.body).to include_json(
          id: 1
      )
    end

    it "index/genérico - JSON 200 ok" do
      get '/customers.json'
      expect(response.body).to include_json(
        [
          id: /\d/,
          name: (be_kind_of String),
          email: (be_kind_of String),
        ]
      )
    end
  end
end
