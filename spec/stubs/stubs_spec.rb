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
end