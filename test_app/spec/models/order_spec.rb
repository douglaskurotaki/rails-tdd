require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Tem um 1 pedido' do
    # as duas linhas de baixa pode eh substituido pela terceira
    # customer = create(:customer)
    # order = create(:order, customer: customer)
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end
end
