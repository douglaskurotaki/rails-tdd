require 'student'
require 'course'

# Mocks testam comportamento e stubs substituem os estado

describe 'Mocks' do
  it '#bar' do
    # setup
    student = Student.new

    # verify
    expect(student).to receive(:bar)

    # exercise
    student.bar
  end

  # Valida os argumentos
  it 'args' do
    student = Student.new
    expect(student).to receive(:foo).with(123)
    student.foo(123)
  end

  # Valida os argumentos e as repeticoes que devem ter
  it 'repetição' do
    student = Student.new
    expect(student).to receive(:foo).with(123).twice #once, twice, exactly(3).times, at_leat(:once), at_least(:twice), at_leat(n).times
    student.foo(123)
    student.foo(123)
  end

  it 'retorno' do
    student = Student.new
    # Forca o retorno
    expect(student).to receive(:foo).with(123).and_return(true)
    # Dessa forma essa declaracao abaixa reotrno true
    student.foo(123)
  end
end