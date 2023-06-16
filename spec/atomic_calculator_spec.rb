ENV['APP_ENV'] = 'test'

require './src/atomic_calculator.rb'
require 'rspec'

RSpec.describe AtomicCalculator do
    subject { described_class.call(base, operator, value) }

    let(:base) { 10 }
    let(:value) { 1 }

    context 'when operator is +' do
        let(:operator) { "+" }

        it "adds the values" do
            expect(subject).to eq base + value
        end
    end

    context 'when operator is -' do
        let(:operator) { "-" }

        it "substracts the values" do
            expect(subject).to eq base - value
        end
    end

    context 'when operator is *' do
        let(:operator) { "*" }

        it "multiplies the values" do
            expect(subject).to eq base * value
        end
    end

    context 'when operator is /' do
        let(:operator) { "/" }

        it "divides the values" do
            expect(subject).to eq base / value
        end
    end
end