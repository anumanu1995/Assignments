class Student

    def initialize(rollNum,studName,*marks)
        @rollNum    =   rollNum
        @studName   =   studName
        @marks     = marks.flatten
        @totalMarks = 0  
    end
    def calculate_total()

        @marks.inject(0){|sum, marks| @totalMarks = @totalMarks + marks.to_i}
        self.display_studentdetails
    end
    def display_studentdetails()
        puts @studName
        puts @rollNum
        puts 'Total marks : ' + @totalMarks.to_s
    end

end

stud = Student.new(10,'Anu',[10,15,20,20,100])
stud.calculate_total