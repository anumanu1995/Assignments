module Calculator
    def electricity_calculator(units)
        if units <= 100
            amount = units * 6
        elsif units > 100 && units <= 300
            amount = 100 * 6 + (units - 100) * 11
        else
            amount = 100 * 6 + (units - 300) * 15
        end
        if amount < 50
            amount = 50
        end
        surcharge = 0.05
        if amount > 300
            surcharge = 0.15
        end
        finalamount =  amount.to_f + (amount.to_f * surcharge.to_f)
    end
end