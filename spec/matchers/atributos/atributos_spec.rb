require 'pessoa'

describe 'Atributos' do
  # Teste com atributos
  it 'have_attributes' do
    pessoa = Pessoa.new
    pessoa.nome = 'Douglas'
    pessoa.idade = 20
    expect(pessoa).to have_attributes(nome: 'Douglas', idade: 20)

    # Validacoes mais complexas
    expect(pessoa).to have_attributes(nome: starting_with('D'), idade: (be >= 20))

    # De forma mais verbosa
    expect(pessoa).to have_attributes(nome: a_string_starting_with('D'), idade: (a_value >= 20))
  end
end