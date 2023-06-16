ENV['APP_ENV'] = 'test'

require './src/calculator.rb'
require 'rspec'

RSpec.describe Calculator do
    subject { described_class.new.call(expressions) }

    let(:expressions) { ["1", "+", "2/3", "+", "3", "-", "2*3"] }

    it { is_expected.to eq(-1.33)}
end