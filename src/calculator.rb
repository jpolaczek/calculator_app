require './src/subcalculator.rb'
require './src/atomic_calculator.rb'
require './src/atomic_parser.rb'

class Calculator
    ALLOWED_OPERATORS = ["-", "+"].freeze
    private_constant :ALLOWED_OPERATORS

    def call(expressions)
        result = 0
        next_operation = ALLOWED_OPERATORS[1]

        expressions.each do |expression|
            evaluated = evaluate_expression(expression)

            case evaluated
            when *ALLOWED_OPERATORS
                next_operation = evaluated
            when Numeric
                result = AtomicCalculator.call(result, next_operation, evaluated)
            end
        end
        result.round(2)
    end

    private

    def evaluate_expression(expression)
        begin
            return Integer(expression)
        rescue ArgumentError
            case expression
            when ALLOWED_OPERATORS[0]
                ALLOWED_OPERATORS[0]
            when ALLOWED_OPERATORS[1]
                ALLOWED_OPERATORS[1]
            else
                Subcalculator.new.call(AtomicParser.call(expression))             
            end
        end
    end
end