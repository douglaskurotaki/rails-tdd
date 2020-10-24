# This will guess the User class
FactoryBot.define do
  factory :customer, aliases: [:user] do
    # atributo transitorio
    transient do
      upcased { false }
    end

    name { Faker::Name.name }
    # email { Faker::Internet.email }

    # sequence(:email) { |n| "meu_email-#{n}@email.com" }
    sequence(:email, 35) { |n| "meu_email-#{n}@email.com" } # 35 eh o numero que vai inciar
    sequence(:email, 'a') { |n| "meu_email-#{n}@email.com" } # a eh a letra que vai inciar, depois b,c,d....

    # gender { %w[M F].sample }

    trait :male do
      gender { 'M' }
    end

    trait :female do
      gender { 'F' }
    end

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    # indica o nome da fabrica e as traits que seroa usadas
    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_vip, traits: [:vip]
    factory :customer_default, traits: [:default]
    factory :customer_male_vip, traits: %i[male vip]
    factory :customer_female_vip, traits: %i[female vip]
    factory :customer_male_default, traits: %i[male default]
    factory :customer_female_default, traits: %i[female default]

    # Apos o create podemos usar o evaluator para acessar os valores dos atributos
    # No caso estamos tentando deixar o valor em uppercase se upcased for true
    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end
