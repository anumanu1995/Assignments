class Set
    @a_arr 
    @b_arr
    @c_arr 
    @u_arr
    def initialize(a_arr,b_arr,c_arr)
        @a_arr = a_arr
        @b_arr = b_arr
        @c_arr = c_arr
        @u_arr = self.getUniversalArray()
    end
    def getUniversalArray
       return  @a_arr | @b_arr | @c_arr
    end
    def getIntersection(a,b)

        return a & b

    end
    def getUnion
        return @a_arr | @b_arr
    end
    def getDiffrence
        return @a_arr - @b_arr
    end
    def getCompliment(b)
        return @u_arr - b
    end
    def getCartesian()
        cfinal = []
        @a_arr.each do |i|
            @b_arr.each do |j|
                cfinal << [i,j]
            end
        end
        return cfinal
    end
    def getDmoraganslaw
        aub_arr = self.getUnion
        aub_arr_comp = self.getCompliment(aub_arr)
        a_comp = self.getCompliment(@a_arr)
        b_comp = self.getCompliment(@b_arr)
        ab_int_arr = self.getIntersection(a_comp,b_comp)
        puts " Dmoragans law (A U B)'=(A'∩ B') that is #{aub_arr_comp} = #{ab_int_arr}"
    end
    def getAssociativelaw
        abint_cint_arr = self.getIntersection(@a_arr,@b_arr) & @c_arr
        aint_bintc_arr = @a_arr & self.getIntersection(@b_arr,@c_arr)
        aub_uc_arr = self.getUnion | @c_arr
        au_buc_arr = @a_arr | ( @b_arr | @c_arr )
        puts " Associative 1st law  (A ∩ B) ∩ C =  A ∩ (B ∩ C) that is #{abint_cint_arr} = #{aint_bintc_arr}"
        puts "2nd law  (A U B) U C = A U (B U C) that is #{aub_uc_arr} = #{au_buc_arr}"

    end
    def getCommutativelaw
        aub = self.getUnion
        bua = @b_arr | @a_arr
        aib = self.getIntersection(@a_arr,@b_arr)
        bia = self.getIntersection(@b_arr,@a_arr)
        puts " Commutative  1st law  A+B = B+A that is #{aub} = #{bua}"
        puts " 2nd law  A.B =B.A that is #{aib} = #{bia}"
    end
    def getResults
        puts "A -#{@a_arr}"
        puts "B - #{@b_arr}"
        puts "C - #{@c_arr}"
        puts "U - #{@u_arr}"
        aunionb = self.getUnion
        aintsb  = self.getIntersection(@a_arr,@b_arr)
        acompl = self.getCompliment(@a_arr)
        cart_pr = self.getCartesian
        puts
        puts "A U B = #{aunionb}"
        puts
        puts "A ∩ B = #{aintsb}"
        puts
        puts "A' = #{acompl}"
        puts
        puts "cartesian product  =  #{cart_pr}"
        puts
        self.getCommutativelaw
        puts
        self.getAssociativelaw
        puts
        self.getDmoraganslaw
    end
end
set = Set.new([1,2,3,4,5,6], [1,2,3,10,47,89], [1,2,5,10,47,9,4])
set.getResults
