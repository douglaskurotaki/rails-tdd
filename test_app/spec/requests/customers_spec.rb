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

    it 'create - JSON' do
      member = create(:member)
      login_as(member, scope: :member)
      headers = { 'ACEPT' => 'application/json' }
      customers_params = attributes_for(:customer)
      post '/customers.json', params: { customer: customers_params }, headers: headers
      expect(response.body).to include_json(
          id: /\d/,
          name: customers_params[:name],
          email: customers_params.fetch(:email) # fetch eh a msm coisa do de cima, porem retorna o erro direito caso tiver
          # address: customers_params.fetch(:address).fetch(:street) para casos aninhados
      )
    end

    it 'update - JSON' do
      member = create(:member)
      login_as(member, scope: :member)
      headers = { 'ACEPT' => 'application/json' }
      customer = Customer.first
      customer.name += ' - ATUALIZADO'
      # Deve usar o customer.attributes para transformar os atributos em parametros
      patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers
      expect(response.body).to include_json(
          id: /\d/,
          name: customer.name,
          email: customer.email
      )
    end

    it 'destroy - JSON' do
      member = create(:member)
      login_as(member, scope: :member)
      headers = { 'ACEPT' => 'application/json' }
      customer = Customer.first
      # Deve usar o customer.attributes para transformar os atributos em parametros
      expect { delete "/customers/#{customer.id}.json", headers: headers }.to change(Customer, :count).by(-1)
      expect(response).to have_http_status(204)
    end

    it "show - RSPEC puro" do
      get '/customers/1.json'
      response_body = JSON.parse(response.body)
      expect(response_body.fetch('id')).to eq(1)
      expect(response_body.fetch('name')).to be_kind_of(String)
      expect(response_body.fetch('email')).to be_kind_of(String)
    end
  end
end
