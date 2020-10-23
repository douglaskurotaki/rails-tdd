require 'contador'

# Verifica se houve mudanca no valor
describe 'Matcher change' do

  # Verifica se houve mudanca qualuqer
  it { expect{ Contador.incrementa }.to change { Contador.qtd } }

  # Verifica se a mudanca foi alterada para 1 valor a mais
  it { expect{ Contador.incrementa }.to change { Contador.qtd }.by(1) }

  # Verifica se a mudanca foi alterada de x valor para y valor from(x) to(y)
  it { expect{ Contador.incrementa }.to change { Contador.qtd }.from(2).to(3) }
end