# Podemos ao inves de declarar um valor a uma variavel, iniciar
# no describe. Ele pegará o valor e já terá armazenado no subject
describe 'Douglas' do
  it 'String' do
    # str = 'Douglas'
    expect(subject.size).to eq(7)
  end
end

# O mesmo vale para array
describe [1, 2] do
  it 'Array' do
    expect(subject).to be_kind_of(Array)
  end
end