class Electricity

    def getElectricityDetails
        users ={}
        units = {}
        userdetails = {}
        puts "Enter  the no of users"
        usernum = gets.chomp.to_i
        puts "Enter user names and units"
        for i in 1..usernum
            users[i] = gets.chomp.to_s
            units[i] =  gets.chomp.to_f
        end

        for i in 1..usernum
            if units[i] in 1..100
                amount = units[i].to_f * 6
            elsif units[i] in 101..300
                amount = units[i].to_f * 11
            elsif units[i] > 300
                amount = units[i] * 15
            end
            if amount < 50
                amount = 50
            end
            surcharge = 0.05
            if amount > 300
                surcharge = 0.15
            end
            finalamount =  amount.to_f + (amount.to_f * surcharge.to_f)
            puts 'User : ' + "#{users[i]}"
            puts 'Units: ' +  "#{units[i]}"
            puts 'Amount: ' + "#{amount}"
            puts 'Total amount including surcharge: ' + "#{finalamount}"
        end
end
end
elect_variable = Electricity.new;
elect_variable.getElectricityDetails()


