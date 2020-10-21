describe 'Matchers de Igualdade' do
  it '#equal - Testa se é o mesmo objeto' do
    x = 'rby'
    y = 'ruby'
    # eq verifica o objeto
    expect(x).not_to equal(y)
    expect(x).to eq(x)
  end

  it '#be Teste se é o mesmo objeto' do
    x = 'ruby'
    y = 'ruby'
    # be verifica o objeto
    expect(x).not_to be(y)
    expect(x).to eq(x)
  end

  it '#eql Testa se é o mesmo valor' do
    x = 'ruby'
    y = 'ruby'
    # eql verifica o valor ou eq
    expect(x).to eql(x)
  end
end