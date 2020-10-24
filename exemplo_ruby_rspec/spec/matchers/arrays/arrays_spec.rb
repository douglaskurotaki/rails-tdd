RSpec::Matchers.define_negated_matcher :an_array_excluding, :include

# collection: true serve para filtrar os testes no terminal
# podemos fazer com chave e valor tambem, no caso ficaria
# describe Array.new([1, 2, 3]), 'Array', type: 'collection' do
# para executar: rspec . -t collection ou rspec . -t type: collection
describe Array.new([1, 2, 3]), 'Array', collection: true do # ou somente collection
  # Verifica se contem um elemento ou mais no array
  it '#include' do
    expect(subject).to include(2)
    expect(subject).to include(2, 1)
  end

  # Matcher na negativa, !==
  it { expect(subject).to an_array_excluding(4) }

  # Elementos devem ser exatos, mas nao precisa ser na ordem
  it '#match_array', :slow do # --tag ~slow     serve para excluir essa tag. Configurado no .rspec
    expect(subject).to match_array([2, 1, 3])
  end

  # Mesmo conceito do match_array, mas nao passamos o array
  it '#contain_exactly' do
    expect(subject).to contain_exactly(1, 2, 3)
  end
end