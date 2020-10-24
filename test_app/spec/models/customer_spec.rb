require 'rails_helper'

RSpec.describe Customer, type: :model do
  # As fixtures serve para nao precisarmos inserir os dados para insersao
  # na hora de teste. Deve criar um arquivo chamado aqui em baixo 'customers na pasta fixtures'
  # fixtures :customers # ou insere all ao inves de customers

  it '#full_name' do
    # subject.name = 'Douglas Kurotaki'
    # subject.email = 'douglas.kurotaki@gmail.com'
    # subject.save

    # customer = customers(:douglas)

    # As fabricas servem justamente para termos esses dados de testes
    # assim criando seu arquivo e sua chamada 'customer' factories/customer.rb
    customer = create(:customer)

    expect(customer.full_name).to start_with('Sr. ')
  end

  # Verifica se os registros criados e caso sim, mudam pra valor 1
  it { expect{ create(:customer) }.to change { Customer.all.size }.by(1) }
end
