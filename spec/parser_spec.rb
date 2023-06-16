ENV['APP_ENV'] = 'test'

require './src/parser.rb'
require 'rspec'

RSpec.describe Parser do
    let(:expression) { "1+2" }

    it "returns an array" do
        expect(described_class.call(expression)).to eq(["1", "+", "2"])
    end

    context 'when expression contains / and *' do
        let(:expression) { "1*2+1/2" }

        it 'returns array grouped by these' do
            expect(described_class.call(expression)).to eq(["1*2", "+", "1/2"])
        end

        context 'when expressions grouped together' do
            let(:expression) { "1*2/3+1/2" }

            it 'returns array grouped by these' do
                expect(described_class.call(expression)).to eq(["1*2/3", "+", "1/2"])
            end
        end
    end
end