FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido número - #{n}" }
    customer
    # association :customer, factory: :customer    eh a msm coisa de cima, porem referencia a fabrica
  end
end
