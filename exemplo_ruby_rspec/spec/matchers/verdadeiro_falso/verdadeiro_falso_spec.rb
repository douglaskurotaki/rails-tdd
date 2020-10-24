 describe 'Matchers Verdadeiro/Falso' do

  # Verifica se é verdadeiro declarado be true
   it 'be true' do
     expect(1.odd?).to be true
   end

   # Verifica se é falso declarado be false
   it 'be false' do
    expect(1.even?).to be false
  end

  # Verifica se é verdadeiro declarado be_truthy
  it 'be_truthy' do
    expect(1.odd?).to be_truthy
  end

   # Verifica se é verdadeiro declarado be_falsey
  it 'be falsey' do
    expect(1.even?).to be_falsey
  end

   # Verifica se está nil com be_nil
  it 'be_nil' do
    expect(defined? x).to be_nil
  end
 end