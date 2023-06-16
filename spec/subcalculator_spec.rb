ENV['APP_ENV'] = 'test'

require './src/subcalculator.rb'
require 'rspec'

RSpec.describe Subcalculator do
    subject { described_class.new.call(expressions) }

    let(:expressions) { ["1", "/", "2", "*", "3"] }

    it { is_expected.to eq(1.5)}
end