require 'calculator'

describe Calculator do
  # Context serve para agrupar
  context '#sum' do
    # Que teste vai ser feito dentro do metodo?
    it 'with positive numbers' do
      calc = Calculator.new
      result = calc.sum(5, 7)
      expect(result).to eq(12)
    end

    # Pode usar it, specify ou example
    it 'wit negative numbers' do
      calc = Calculator.new
      result = calc.sum(-5, 7)
      expect(result).to eq(2)
    end
  end

  # Testes devem ser confiaveis, faceis de escrever e nao estar focado em velocidade

  # 4 fases: Setup (preparo do teste). Exercice (exercicio do teste)
  # verify(checagem do valor esperado). Teardown (deixa tudo como estava antes do teste)
end
