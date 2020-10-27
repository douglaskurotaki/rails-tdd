require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do
    # as duas linhas de baixa pode eh substituido pela terceira
    # customer = create(:customer)
    # order = create(:order, customer: customer)
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Tem 3 pedidos - create_list' do
    # Create List faz com que nao precisemos criar varias instancias
    # basta inserir o numero de instancia no parametro
    # Caso queira sobreescrever algum campo, basta inserir o nome dele e o valor
    orders = create_list(:order, 3, description: 'Teste')
    puts orders.inspect
    expect(orders.count).to eq(3)
  end

  it 'has_many' do
    # o has_many permite que nas factories possamos criar uma forma de o arquivo
    # criar em lote usando um transient. Assim o valor dela sera o numero de criacao
    # customer = create(:customer, :with_orders, qtt_orders: 5)
    customer = create(:customer_with_orders, qtt_orders: 5)
    puts customer.inspect
    puts customer.orders.inspect
    expect(customer.orders.count).to eq(5)
  end

  # Cria somente dois
  it 'create pair' do
    orders = create_pair(:order)    
    expect(orders.count).to eq(2)
  end
end
