describe 'Matchers de Comparação' do
  it '>' do
    expect(5).to be > 1
  end

  it '>=' do
    expect(5).to be >= 5
  end

  it '<' do
    expect(5).to be < 12
  end

  it '<=' do
    expect(5).to be <= 5
  end

  # Compara se esta dentro com >= <=
  it 'be_between inclusive' do
    expect(5).to be_between(2, 7).inclusive
    expect(2).to be_between(2, 7).inclusive
    expect(7).to be_between(2, 7).inclusive
  end

  # Compara se esta dentro com > <
  it 'be_between exclusive' do
    expect(5).to be_between(2, 7).exclusive
    expect(3).to be_between(2, 7).exclusive
    expect(6).to be_between(2, 7).exclusive
  end

  # REGEX
  it 'match' do
    expect('fulano@com.br').to match(/..@../)
  end

  it 'start_with' do
    expect('fulano').to start_with('fulano')

    # Com array
    expect([1, 2, 3]).to start_with(1)
  end

  it 'end_with' do
    expect('fulano de tal').to end_with('tal')

    # Com array
    expect([1, 2, 3]).to end_with(3)
  end
end