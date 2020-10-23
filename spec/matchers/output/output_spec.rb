describe 'Matcher output' do
  # Verifica se ha saida no terminal
  it { expect{ puts 'jackson' }.to output.to_stdout }

  # Verifica se ma saida do terminal eh jackson
  it { expect{ print 'jackson' }.to output('jackson').to_stdout }

  # Verifica se ma saida do terminal contem jackson
  it { expect{ print 'jackson pires' }.to output(/jackson/).to_stdout }

  # Situacao de erro igual as anteriores
  it { expect{ warn 'jackson' }.to output.to_stderr }
  # it { expect{ warn 'jackson' }.to output('jackson').to_stderr }
  it { expect{ warn 'jackson pires' }.to output(/jackson/).to_stderr }
end