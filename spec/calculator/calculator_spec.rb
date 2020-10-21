require 'calculator'

describe Calculator do
  # Para criar uma instancia com um nome personalizado
  #   subject(:calc) { described_class.new() }

  # Context serve para agrupar
  context '#sum' do
    # Que teste vai ser feito dentro do metodo?
    it 'with positive numbers' do
      # Subject faz uma instancia da classe automaticamente
      result = subject.sum(5, 7)
      expect(result).to eq(12)
      # Resultado que não esperamos not_to
      # expect(result).not_to eq(1)
    end

    # Pode usar it, specify ou example
    it 'with negative numbers' do
      result = subject.sum(-5, 7)
      expect(result).to eq(2)
    end

    # xit deixa o teste pendente
    xit 'with negative numbers' do
      result = subject.sum(-5, 7)
      expect(result).to eq(2)
    end
  end

  # Testes devem ser confiaveis, faceis de escrever e nao estar focado em velocidade

  # 4 fases: Setup (preparo do teste). Exercice (exercicio do teste)
  # verify(checagem do valor esperado). Teardown (deixa tudo como estava antes do teste)

  # Podemos especificar o teste no terminal usando:
  # rspec spec/calculator/calculator_spec.rb -e 'with positive numbers'
  # Testando a linha especificadamente usando o dois pontos ':'
  # rspec spec/calculator/calculator_spec.rb:15

  # Subject implicito -> subject
  # Podemos usar describles pais, "O mais interno vence (subject)"
  # Subject explicito -> redefine o nome subject(:calc) { described_class.new() }
  # Podemos passar um texto pro describle, describle Calculato, "Sobre a calculadora" do

  # Matcher são forma de deixar os métodos mais expressivos como expected ou not_expected
end
