describe 'all', type: 'collection' do
  # O all serve para testar todos os elementos com alguma condicao
  # Podemos usar composicao tambem
  it { expect([1, 7, 9]).to all (be_odd).and be_an(Integer) }
  it { expect(['ruby', 'rails']).to all( be_a(String).and include('r'))}
end