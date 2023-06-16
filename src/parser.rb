class Parser
    DIVISIONS_AND_MULTIPLICATIONS = /\b(\d+(?:[\/*]\d+)+)\b/

    private_constant :DIVISIONS_AND_MULTIPLICATIONS

    class << self
        def call(expression)
            expression
                .gsub(DIVISIONS_AND_MULTIPLICATIONS, ' \1 ')
                .gsub(/[+]/, ' + ')
                .gsub(/[-]/, ' - ')
                .split(' ')
        end
    end
end