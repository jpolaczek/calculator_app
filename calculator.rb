require 'sinatra'
require './src/calculator'
require './src/parser'

get "/" do
    return 'no expression provided' unless params[:expression]

    {
        result: Calculator.new.call(Parser.call(params[:expression])),
        expression: params[:expression]
    }.to_json
end