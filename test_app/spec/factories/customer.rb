# This will guess the User class
FactoryBot.define do
  factory :customer, aliases: [:user] do
    # atributo transitorio
    transient do
      upcased { false }
    end

    name { Faker::Name.name }
    email { Faker::Internet.email }

    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    factory :customer_default do
      vip { false }
      days_to_pay { 15 }
    end

    # Apos o create podemos usar o evaluator para acessar os valores dos atributos
    # No caso estamos tentando deixar o valor em uppercase se upcased for true
    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end
