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
  end
end
