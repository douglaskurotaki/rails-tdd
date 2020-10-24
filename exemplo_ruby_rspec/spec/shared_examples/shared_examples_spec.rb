require 'pessoa'

shared_examples 'status' do |sentimento|
  it "#{sentimento}" do
    # O send faz com que possamos passar o nome do metodo para, no caso a pessoa
    # O metodo por exemplo feliz, existem em pessoa. Assim podemos acessar e comparar
    pessoa.send("#{sentimento}!")
    expect(pessoa.status).to eq("Sentindo-se #{sentimento.capitalize}!")
  end
end
describe 'Pessoa' do
  subject(:pessoa) { Pessoa.new }

  # De forma repetitiva
  # it 'feliz' do
  #   pessoa.feliz!
  #   expect(pessoa.status).to eq('Sentindo-se feliz!')
  # end

  # it 'triste' do
  #   pessoa.triste!
  #   expect(pessoa.status).to eq('Sentindo-se triste!')
  # end

  # it 'contente' do
  #   pessoa.contente!
  #   expect(pessoa.status).to eq('Sentindo-se contente!')
  # end

  # Envia o parametro feliz para o shared_examples referente o 'status'
  include_examples 'status', :feliz
  # As duas de baixa mostra o texto de como deve se comportar
  it_behaves_like 'status', :triste
  it_should_behave_like 'status', :contente
end