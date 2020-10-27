require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Tem um 1 pedido' do
    # as duas linhas de baixa pode eh substituido pela terceira
    # customer = create(:customer)
    # order = create(:order, customer: customer)
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Tem 3 pedidos' do
    # Create List faz com que nao precisemos criar varias instancias
    # basta inserir o numero de instancia no parametro
    # Caso queira sobreescrever algum campo, basta inserir o nome dele e o valor
    orders = create_list(:order, 3, description: 'Teste')
    puts orders.inspect
    expect(orders.count).to eq(3)
  end
end
