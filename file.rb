require 'numbers_and_words'
require 'fileutils'
class Filetask
    def readFile(filename)
        if File.exists?(filename)
            f = File.open(filename,'r+')
            puts f.read
        end
       self.writeFile(filename)
    end
    def writeFile(filename)
        convertd = {}
        if File.exists?(filename)
            f = File.open(filename,'r+')
            lines = f.readlines
            i=0
            for a in lines
                word = a.to_i
                convertd[i] = word.to_words
                i+=1
             end
            f.close
         
            File.open(filename, "w+") do |f| 
                  convertd.each { |element,value| f.puts(value) } 
              end 
              puts "successfully replaced"
        end
    end
    def copyFile(filename,newfilename)
        FileUtils.copy(filename,newfilename)
        puts "File content copied to #{newfilename}" 
    end
end
file_task = Filetask.new
file_task.readFile("number.txt")
file_task.copyFile("number.txt","new.txt")