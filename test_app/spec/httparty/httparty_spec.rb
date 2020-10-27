describe 'HTTParty' do
  # Serve para acessar um api externa e pegar os dados provenientes nela
  # utilizamos gem httparty
  it 'Httparty' do
    # faz a requisicao e insere para o atributo
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    puts content_type
    expect(content_type).to match(/application\/json/)
  end
end