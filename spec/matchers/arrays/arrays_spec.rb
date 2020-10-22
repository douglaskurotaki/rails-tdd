describe Array.new([1, 2, 3]), 'Array' do
  # Verifica se contem um elemento ou mais no array
  it '#include' do
    expect(subject).to include(2)
    expect(subject).to include(2, 1)
  end

  # Elementos devem ser exatos, mas nao precisa ser na ordem
  it '#match_array' do
    expect(subject).to match_array([2, 1, 3])
  end

  # Mesmo conceito do match_array, mas nao passamos o array
  it '#contain_exactly' do
    expect(subject).to contain_exactly(1, 2, 3)
  end
end