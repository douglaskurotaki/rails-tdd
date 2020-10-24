$count = 0;

describe 'let!' do
  ordem_de_invocacao = []

  # O let! inicia antes do teste iniciar e nao ao invocar pela primeira
  # vez a variavel
  let!(:countador) do
    ordem_de_invocacao << :let!
    $count += 1
  end

  it 'chama o método helper antes do teste' do
    ordem_de_invocacao << :exemplo
    expect(ordem_de_invocacao).to eq([:let!, :exemplo])
  end
end