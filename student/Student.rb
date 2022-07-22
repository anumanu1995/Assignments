class Student

    def setStudDetails(rollNum,studName,mark1,mark2,mark3)
        @rollNum    =   rollNum
        @studName   =   studName
        @mark1      =   mark1
        @mark2      =   mark2
        @mark3      =   mark3
        self.calculateTotal   
    end
    def calculateTotal()
        @totalMarks = @mark1.to_i + @mark2.to_i + @mark3.to_i
        self.displayStudDetails
    end
    def displayStudDetails()
        puts @studName
        puts @rollNum
        puts 'Total marks : ' + @totalMarks.to_s
    end

end


class StudentDemo < Student
    def getStudDetails(rollNum,studName,mark1,mark2,mark3)
        setStudDetails(rollNum,studName,mark1,mark2,mark3)
    end
end

stud = StudentDemo.new
stud.getStudDetails(10,'Anu',10,15,20)