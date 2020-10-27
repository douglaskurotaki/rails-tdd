describe 'HTTParty' do

  it 'content-type' do
    # Evita a consulta na internet para fazer o teste ser mais rapido
    # Faz com que simulemos uma consulta da api, mas eh so uma SIMULACAO
    # stub_request(:get, 'https://jsonplaceholder.typicode.com/posts/2').
    #   to_return(status: 200, body: '', headers: { 'content-type': 'application/json' })

    # O VCR faz com que haja a requisicao na internet, mas na proxima vez
    # nao fara, pois ele vai gravar em um arquivo configurado no spec_rails
    VCR.use_cassette('jsonplaceholder/posts') do
      # Serve para acessar um api externa e pegar os dados provenientes nela
      # utilizamos gem httparty
      # faz a requisicao e insere para o atributo
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
      content_type = response.headers['content-type']
      puts content_type
      expect(content_type).to match(/application\/json/)
    end
  end

  it 'metadados vcr', :vcr do # ou caso nao quiser que o vcr crie uma pasta do describe e referencia a uma especifica
                              # usamos ao inves do :vcr, o vcr: { cassette_name: 'jsonplaceholder/posts' }
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    puts content_type
    expect(content_type).to match(/application\/json/)
  end

  # Essa compara a url com o body. Quando fixamos um outro numero fazendo salvar no mesmo arquivo
  # vai dar erro. E por isso temos que fazer o match_requests_on. Para comparar pelo body
  it 'url não determinada vcr', vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body] } do
    response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/#{[1, 2, 3, 4, 5].sample}")
    content_type = response.headers['content-type']
    puts content_type
    expect(content_type).to match(/application\/json/)
  end
end