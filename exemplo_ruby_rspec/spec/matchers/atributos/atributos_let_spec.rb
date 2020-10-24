require 'pessoa'

describe 'Atributos' do
  # before(:each) do        
  #   pessoa = Pessoa.new
  # end

  # O let substitui o caso de cima (before), pois ela eh instanciada uma vez so
  # no caso, na primeira vez que eh usada ocorre a instancia.
  let(:pessoa) { Pessoa.new }

  # Teste com atributos
  it 'have_attributes' do
    pessoa.nome = 'Douglas'
    pessoa.idade = 20
    expect(pessoa).to have_attributes(nome: 'Douglas', idade: 20)

    # Validacoes mais complexas
    expect(pessoa).to have_attributes(nome: starting_with('D'), idade: (be >= 20))

    # De forma mais verbosa
    expect(pessoa).to have_attributes(nome: a_string_starting_with('D'), idade: (a_value >= 20))

    # Link para metodos alias
    # https://gist.github.com/JunichiIto/f603d3fbfcf99b914f86
  end

  it 'have_attributes' do
    pessoa.nome = 'Jose'
    pessoa.idade = 20
    expect(pessoa).to have_attributes(nome: 'Jose', idade: 20)

    expect(pessoa).to have_attributes(nome: starting_with('J'), idade: (be >= 20))

    expect(pessoa).to have_attributes(nome: a_string_starting_with('J'), idade: (a_value >= 20))
  end
end