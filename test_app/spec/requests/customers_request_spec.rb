require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'as a Guest' do
    context '#index' do
       # Testando controller
      it 'responds successfully' do
        get :index
        expect(response).to be_successful
      end
  
      it 'returns a 200 response' do
        get :index
        expect(response).to have_http_status(200)
      end
    end
  end
   
  describe 'as Logged Member' do
    it 'returns a 302 response(not authorized)' do
      customer = create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(302)
    end

    it 'render a :show template' do
      member = create(:member)
      customer = create(:customer)
      sign_in member
      get :show, params: { id: customer.id }
      # expect(response).to have_http_status(200)

      # Testa o template gerado no controller
      expect(response).to render_template(:show)
    end

    before do 
      @member = create(:member)
      @customer = create(:customer)
    end

    it 'with valid attributes' do
      # Cria um hash com os dados necessarios para criacao de um novo registro
      customer_params = attributes_for(:customer)
      sign_in @member
      expect{ 
        post :create, params: { customer: customer_params }
      }.to change(Customer, :count).by(1) # Verifica se foi adicionado um novo registro
    end

    # Testando a mensagem apos a criacao do customer
    it 'Flash Notice' do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, params: { customer: customer_params }
      expect(flash[:notice]).to match(/successfully created/)
    end

    # Testando se a resposta do content-type eh a do json
    it 'Content-Type JSON' do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, format: :json, params: { customer: customer_params }
      expect(response.content_type).to eq('application/json')
    end
  end
end
