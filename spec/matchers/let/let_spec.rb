$counter = 0

describe 'let' do
  let(:count) { $counter += 1 }

  it 'memoriza o valor' do
    # 1a vez
    expect(count).to eq(1)

    # 2a Cache
    expect(count).to eq(1)
  end

  it 'não é cahceado entre os testes' do
    # 1a vez desse teste
    expect(count).to eq(2)
  end
end