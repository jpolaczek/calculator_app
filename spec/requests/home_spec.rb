ENV['APP_ENV'] = 'test'

require './calculator.rb'
require 'rspec'
require 'rack/test'

RSpec.describe 'Calculator app' do
    include Rack::Test::Methods

    let(:expression) { nil }

    subject { get '/', { expression: expression } }

    def app
        Sinatra::Application
    end

    it "returns value" do
        subject
        expect(last_response).to be_ok
        expect(last_response.body).to eq('no expression provided')
    end

    context 'when expression given' do
        let(:parsed_expression) { double 'expression' }
        let(:calculator)        { double 'calculator' }
        let(:result)            { 'result' }
        let(:expression)        { 'expression' }

        it 'calls calculator and parser', :aggregate_errors do
            expect(Parser).to receive(:call).with(expression).and_return(parsed_expression)
            expect(Calculator).to receive(:new).and_return(calculator)
            expect(calculator).to receive(:call).with(parsed_expression).and_return(result)

            subject

            expect(last_response).to be_ok
            expect(JSON.parse(last_response.body)).to eq({
                'result' => result,
                'expression' => expression
            })
        end
    end
end