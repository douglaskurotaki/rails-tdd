# Os dubles de testes servem para mockar ou seja, criar uma classe falsa
# no caso o User e passarmos o que ele tem de chamada e o que ele ira
# retornar. No caso chamada eh name e password e retorno Jack e secret
describe 'Test Double' do
  it '--' do
    # usamos o double('Classe_falsa') para criar o dublê para teste
    user = double('User')
    
    # usamos allow para permitir quem vai ser usado para o teste
    # e o receive_messages para indicar quem eh a chamada e o retorno
    allow(user).to receive_messages(name: 'Jack', password: 'secret')

    # Podemos tambem usar tambem o receive .and_return o que faria a mesma coisa
    # porem mais verboso
    allow(user).to receive(:name).and_return('Jack')
    allow(user).to receive(:password).and_return('secret')
    puts user.name
    puts user.password
  end
end