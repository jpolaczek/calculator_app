class AtomicParser
    class << self
        def call(expression)
            expression.gsub(/[\/]/, ' / ').gsub(/[*]/, ' * ').split(" ")
        end
    end
end