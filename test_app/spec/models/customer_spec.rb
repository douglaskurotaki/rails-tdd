require 'rails_helper'

RSpec.describe Customer, type: :model do
  # As fixtures serve para nao precisarmos inserir os dados para insersao
  # na hora de teste. Deve criar um arquivo chamado aqui em baixo 'customers na pasta fixtures'
  # fixtures :customers # ou insere all ao inves de customers

  it 'Create a Customer' do
    # subject.name = 'Douglas Kurotaki'
    # subject.email = 'douglas.kurotaki@gmail.com'
    # subject.save

    # customer = customers(:douglas)

    # As fabricas servem justamente para termos esses dados de testes
    # assim criando seu arquivo e sua chamada 'customer' factories/customer.rb
    customer = create(:customer)

    expect(customer.full_name).to eq('Sr. Douglas Kurotaki')
  end
end
