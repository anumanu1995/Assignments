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

#please do follow Ruby naming conventions for creating method names like_this
#for calculating Student marks, please think of writing code with minimal changes for the future changes
#say for example what if the User wants add an extra subject and it's marks
#with the current approach, we need to change code at reading input/ initializing/ calculating total , in almost all stages
#you can use something likes this : [1,2,3].inject(0){|sum, marks| sum = sum + marks} instead of summing all of them individually
#and there is an *args param, think of it how we can use that in this scenario.



#The code too tightly coupled, not a recomanded approach.

