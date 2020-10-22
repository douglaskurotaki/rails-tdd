describe 'satisfy' do
  # 1 opcao e o be_even de forma mais clara
  it { expect(10).to be_even }

  # 2 opcao e o satisfy com a condicao em chave ou em bloco
  it { expect(10).to satisfy { |x| x % 2 == 0 } }
  it {
    expect(10).to satisfy('be a multiple of 3') do |x|
      x % 2 == 0
    end
  }
end