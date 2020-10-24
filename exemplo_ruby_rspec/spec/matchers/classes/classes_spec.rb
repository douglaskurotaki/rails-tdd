require 'string_nao_vazia'

describe 'Classes' do

  # Teste as Classes
  it 'be_instance_of' do
    expect(10).to be_instance_of(Integer)
  end

  # Testa Classes e Classes Pai, Garante toda heranca
  it 'be_kind_of' do
    str = StringNaoVazia.new
    expect(str).to be_kind_of(String)
    expect(str).to be_kind_of(StringNaoVazia)
  end

  # Mesma coisa do be_kind_of, mas mais conotativo
  it 'be_a / be_an' do
    str = StringNaoVazia.new
    expect(str).to be_a(String)
    expect(str).to be_a(StringNaoVazia)

    expect(str).to be_an(String)
    expect(str).to be_an(StringNaoVazia)
  end

  # Verifica se a classes ou valor responde a determinado metodo
  # ex. String possui metodos size e count
  it 'respond_to' do
    expect('ruby').to respond_to(:size)
    expect('ruby').to respond_to(:count)
  end
end