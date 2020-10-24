require 'student'
require 'course'

# Stub serve para forcarmos um retorno de um metodo de uma classe
# existente. Podendo passar o determinado tipo do parametro e forcar o valor a retornar

describe 'Stubs' do
  it 'has_finished' do
    student = Student.new
    course = Course.new

    # Permitir um objeto de estudante a receber um metodo 'has_finished'
    # com uma instancia (no caso o parametro) de curso e retornar verdadeiro
    allow(student).to receive(:has_finished?).with(an_instance_of(Course)).and_return(true)

    # Como fizemos em cima retornar verdadeiro, mesmo na classes ter outras regras
    # ela sempre ira retornar true se a declaracao acima der certo
    course_finished = student.has_finished?(course)

    expect(course_finished).to be_truthy
  end

  it 'Argumentos Dinâmicos' do
    student = Student.new

    # Nessa parte podemos verificar o parametro passado pro metodo foo
    allow(student).to receive(:foo) do |arg| # arg eh o argumento
      if arg == :hello
        'Olá'
      elsif arg == :hi
        'Hi'
      end
    end

    # Aqui definimos o argumento e comparamos
    expect(student.foo(:hello)).to eq('Olá')
    expect(student.foo(:hi)).to eq('Hi')
  end

  # Aqui verificamos qualquer instnacia passada na classe
  it 'Qualquer Instância de Classe' do
    student = Student.new
    other_student = Student.new

    # allow_any_instance faz com que possamos verificar se a classe de qualquer instancia
    # receba o metodo bar
    allow_any_instance_of(Student).to receive(:bar).and_return(true)

    expect(student.bar).to be_truthy
    expect(other_student.bar).to be_truthy
  end


  # Aqui conseguimos tratar alguns erros testados
  it 'Erros' do
    student = Student.new
    # fizemos aqui o and_raise(RuntimeError) para forcar dar esser erro qnd o metodo for bar
    allow(student).to receive(:bar).and_raise(RuntimeError)

    # Nessa parte podemos fazer a excessao com raise_error
    expect{ student.bar }.to raise_error(RuntimeError)
  end
end