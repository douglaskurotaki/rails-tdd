# require_relative 'helper'

# Alem do require eh necessaro incluir a classe dessa forma
# RSpec.configure do |conf|
#   conf.include Helper
# end

describe 'Ruby on Rails' do
  it { is_expected.to start_with('Ruby').and end_with('Rails') }
  it { expect(frutas).to eq('banana').or eq('laranja').or eq('uva') }

  # helper method arbitrario
  # def frutas
  #   %w[banana laranja uva].sample
  # end
end