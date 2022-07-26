require 'Date'
class Datetask
    @input_date
    @input_date_type
    def initialize(input_date,input_date_type)
        @input_date = input_date
        @input_date_type = input_date_type
    end
    def getconverted_dates
        output = []
        case @input_date_type
        when 'IST'
            output << Date.parse(@input_date).strftime('%d/%m/%Y')
            
          
        when 'PST'
            output << Date.parse(@input_date).strftime('%m/%d/%Y')
            output << Date.parse(@input_date).strftime("%B %-d, %Y %Z")
            output << Date.parse(@input_date).strftime("%m/%d/%Y %I %p")
            output << Date.parse(@input_date).strftime("%m/%d/%y")
        when 'ORT'
            output << Date.parse(@input_date).strftime('%Y/%m/%d %H:%M:%S %z')
            output << Date.parse(@input_date).strftime("%Y%m%d")
            output << Date.parse(@input_date).strftime("%Y-%m-%d %H:%M:%S %Z")
            output << Date.parse(@input_date).strftime("%Y/%m/%d %I:%M:%S %p")
        else
            output << Date.parse(@input_date).strftime('%d/%m/%Y')
           
        end
        puts "#{@input_date_type} in various date formats"
        puts "------------------------"
        puts output
    end


end
puts "Enter a valid date format"
date_value = gets.chomp.to_s
puts "Enter a valid date type"
type_value = gets.chomp.to_s
date = Datetask.new(date_value,type_value)
date.getconverted_dates


# first line itself syntax error.
#class inside instance varaible declarations
