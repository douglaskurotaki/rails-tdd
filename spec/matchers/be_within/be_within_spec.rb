describe 'be_within' do
  # Teste entre numero com casa decimais DELTA
  # be_within verifica se o valor esta na casa dos 12.
  # Podendo ter diferenca de 0.5 pra frente ou pra traz
  it { expect(12.5).to be_within(0.5).of(12) }
  it { expect([11.6, 12.1, 12.4]).to all (be_within(0.5).of(12)) }
end