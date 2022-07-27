$LOAD_PATH << '.'
require 'calculator'
class Electricity
include Calculator
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
            finalamount = self.electricity_calculator(units[i])
            puts 'User : ' + "#{users[i]}"
            puts 'Units: ' +  "#{units[i]}"
            puts 'Total amount including surcharge: ' + "#{finalamount}"
        end
end
end
elect_variable = Electricity.new;
elect_variable.getElectricityDetails()


