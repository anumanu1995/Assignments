class Dictionary
   
   def initialize
    @book = Hash.new
        @book = {
        'Apple' => 'A fruit',
        'Boat'   => 'A small ship',
        'Cat'   =>  'An animal'

        }
    end
   def addWord(word,meaning)
    @book[word] = meaning
    puts "Word added"
    puts
    self.list
    puts
   end
   
   def updateword(word,meaning)
    if @book.key?(word)==true
        @book[word] = meaning
        puts "Word updated"
        self.list
    else
        puts "Not found"
    end
   end
   def searchword(word)
    if @book.key?(word)==true
        puts "Here is the meaning"
        puts word
        puts @book[word]
    else
        puts "Not found"
    end
   end
   def deleteword(word)
    if @book.key?(word)==true
        @book.delete(word)
        puts "Deleted word"
        self.list
    else
        puts "Not found"
    end
end
def list
    @book.each do |word , meaning|
        puts word + ' = ' + meaning
    end
end
end

class Mode < Dictionary
    def getmode
        puts "Enter the mode from 1=>add,2=>search,3=>update,4=>delete"
        mode = gets.chomp.to_i
        case mode
        when 1
            puts "Enter the word"
            inputword = gets.chomp
            puts "Enter the meaning"
            inputmeaning = gets.chomp
            addWord(inputword,inputmeaning)
            self.getmode
        when 2
            puts "Enter the word"
            inputword = gets.chomp
            searchword(inputword)
            self.getmode
        when 3
            puts "Enter the word"
            inputword = gets.chomp
            puts "Enter the meaning"
            inputmeaning = gets.chomp
            updateword(inputword,inputmeaning)
            self.getmode
        when 4
            puts "Enter the word"
            inputword = gets.chomp
            deleteword(inputword)
            self.getmode
        else
          puts "Invalid mode"
          self.getmode
        end
        
    end
    
end
mode = Mode.new
mode.getmode