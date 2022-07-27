class Student

    def set_studentdetails(rollNum,studName,*marks)
        @rollNum    =   rollNum
        @studName   =   studName
        @marks     = marks.flatten
        @totalMarks = 0
        self.calculate_total   
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


class StudentDemo < Student
    def get_studdetails(rollNum,studName,*marks)
        set_studentdetails(rollNum,studName,*marks)
    end
end

stud = StudentDemo.new
stud.get_studdetails(10,'Anu',[10,15,20,20,100])