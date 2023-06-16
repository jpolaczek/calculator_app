class AtomicCalculator
    class << self
        def call(base, operator, value)
            case operator
            when "+"
                base += value
            when "-"
                base -= value
            when "*"
                base *= value
            when "/"
                base = base.to_f / value.to_f   
            end
        end
    end
end