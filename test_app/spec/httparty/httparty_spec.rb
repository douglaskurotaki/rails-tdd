describe 'HTTParty' do

  it 'content-type' do
    # Evita a consulta na internet para fazer o teste ser mais rapido
    # Faz com que simulemos uma consulta da api, mas eh so uma SIMULACAO
    stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2').
      to_return(status: 200, body: '', headers: { 'content-type': 'application/json' })

    # Serve para acessar um api externa e pegar os dados provenientes nela
    # utilizamos gem httparty
    # faz a requisicao e insere para o atributo
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    puts content_type
    expect(content_type).to match(/application\/json/)
  end
end