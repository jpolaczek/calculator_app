class Subcalculator
    ALLOWED_OPERATORS = ["/", "*"].freeze

    private_constant :ALLOWED_OPERATORS

    def call(expressions)
        result = 0
        next_operation = nil

        expressions.each do |expression|
            evaluated = evaluate_expression(expression)
            
            if ALLOWED_OPERATORS.include?(evaluated)
                next_operation = evaluated
            elsif evaluated.is_a?(Integer) && next_operation
                result = AtomicCalculator.call(result, next_operation, evaluated)
            else
                result = evaluated
            end
        end
        result
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
                AtomicParser.call(expression)               
            end
        end
    end
end