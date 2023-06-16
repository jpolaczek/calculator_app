ENV['APP_ENV'] = 'test'

require './src/atomic_parser.rb'
require 'rspec'

RSpec.describe AtomicParser do
    let(:expression) { "1/2*3" }

    it "returns an array" do
        expect(described_class.call(expression)).to eq(["1", "/", "2", "*", "3"])
    end
end