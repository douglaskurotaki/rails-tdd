require 'calculator'

describe Calculator do
  # Que teste vai ser feito?
  it 'use sum method for 2 numbers' do
    calc = Calculator.new
    result = calc.sum(5, 7)
    expect(result).to eq(12)
  end

  # Pode usar it, specify ou example
  specify 'use sum method for 2 numbers with negative numbers' do
    calc = Calculator.new
    result = calc.sum(-5, 7)
    expect(result).to eq(2)
  end

  # Testes devem ser confiaveis, faceis de escrever e nao estar focado em velocidade

  # 4 fases: Setup (preparo do teste). Exercice (exercicio do teste)
  # verify(checagem do valor esperado). Teardown (deixa tudo como estava antes do teste)
end
