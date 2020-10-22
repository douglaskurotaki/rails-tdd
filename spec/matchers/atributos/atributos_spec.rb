require 'pessoa'

describe 'Atributos' do
  before(:each) do
    puts '>>>> Antes'
    # Aqui conseguimos antes de iniciar o teste
    # instanciar a pessoa colocando na variaevel @pessoa
    @pessoa = Pessoa.new
  end

  after(:each) do
    puts '>>>> Depois'
    @pessoa.nome = 'Sem nome'
    puts ">>>>>>>>>>> #{@pessoa.inspect}"
  end

  # Teste com atributos
  it 'have_attributes' do
    @pessoa.nome = 'Douglas'
    @pessoa.idade = 20
    expect(@pessoa).to have_attributes(nome: 'Douglas', idade: 20)

    # Validacoes mais complexas
    expect(@pessoa).to have_attributes(nome: starting_with('D'), idade: (be >= 20))

    # De forma mais verbosa
    expect(@pessoa).to have_attributes(nome: a_string_starting_with('D'), idade: (a_value >= 20))

    # Link para metodos alias
    # https://gist.github.com/JunichiIto/f603d3fbfcf99b914f86
  end

  it 'have_attributes' do
    @pessoa.nome = 'Jose'
    @pessoa.idade = 20
    expect(@pessoa).to have_attributes(nome: 'Jose', idade: 20)

    expect(@pessoa).to have_attributes(nome: starting_with('J'), idade: (be >= 20))

    expect(@pessoa).to have_attributes(nome: a_string_starting_with('J'), idade: (a_value >= 20))
  end
end