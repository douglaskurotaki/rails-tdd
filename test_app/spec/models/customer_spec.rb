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
    # Usando aliases para se customer se chamar user
    customer = create(:user)
    # customer = build(:user)

    expect(customer.full_name).to start_with('Sr. ')
  end

  # Verifica se os registros criados e caso sim, mudam pra valor 1
  it { expect{ create(:customer) }.to change { Customer.all.size }.by(1) }

  it 'Sobreescrevendo atributo' do
    customer = create(:user, name: 'Douglas Kurotaki') # name: '' sobreescreve atributo
    expect(customer.full_name).to start_with('Sr. Douglas Kurotaki')
  end

  # Factories aninhados para determinar outros atributos
  it 'Herança' do
    customer = create(:customer_default)
    expect(customer.vip).to eq(false)
  end

  # Attr_for eh uma forma de podermos criar uma hash com os dados salvos na factory
  it 'Usando o attributes_for' do
    attrs = attributes_for(:customer) # { name: 'fulano', email: 'fulano@gmail.com' }
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with('Sr. ')
  end

  # Serve para criar uma atributo que nao eh usado na criacao, mas que serve
  # para auxiliar em algum processo
  it 'Atributo Transitório' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  # As Traits servem para compor as fabricas, assim nao precisamos colocar mais
  # de uma fabrica no create. Basta criar as trates igual uma fabrica e depois
  # criar as fabricas compondo as traits como no customer.rb
  it 'Cliente Masculino' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
  end

  it 'Cliente Masculino VIP' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Feminino' do
    customer = create(:customer_female)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Masculino Default' do
    customer = create(:customer_female_default)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(false)
  end

  # sequence eh uma forma de ir incrementando algum valor ao criar
  it 'sequence' do
    customer = create(:user)
    puts customer.email

    expect(customer.full_name).to start_with('Sr. ')
  end
end
