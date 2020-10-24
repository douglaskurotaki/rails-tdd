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
end