class Set
    @a_arr 
    @b_arr
    @c_arr 
    @u_arr
    def initialize(a_arr,b_arr,c_arr)
        @a_arr = a_arr
        @b_arr = b_arr
        @c_arr = c_arr
        @u_arr = self.getuniversal_array()
    end
    def getuniversal_array
       return  @a_arr | @b_arr | @c_arr
    end
    def getintersection_array(a,b)

        return a & b

    end
    def getunion_array
        return @a_arr | @b_arr
    end
    def getcompliment_array(b)
        return @u_arr - b
    end
    def getcartesian_array()
        cfinal = []
        @a_arr.each do |i|
            @b_arr.each do |j|
                cfinal << [i,j]
            end
        end
        return cfinal
    end
    def getdmorgans_law
        aub_arr = self.getunion_array
        aub_arr_comp = self.getcompliment_array(aub_arr)
        a_comp = self.getcompliment_array(@a_arr)
        b_comp = self.getcompliment_array(@b_arr)
        ab_int_arr = self.getintersection_array(a_comp,b_comp)
        puts " Dmoragans law (A U B)'=(A'∩ B') that is #{aub_arr_comp} = #{ab_int_arr}"
    end
    def getassociative_law
        abint_cint_arr = self.getintersection_array(@a_arr,@b_arr) & @c_arr
        aint_bintc_arr = @a_arr & self.getintersection_array(@b_arr,@c_arr)
        aub_uc_arr = self.getunion_array | @c_arr
        au_buc_arr = @a_arr | ( @b_arr | @c_arr )
        puts " Associative 1st law  (A ∩ B) ∩ C =  A ∩ (B ∩ C) that is #{abint_cint_arr} = #{aint_bintc_arr}"
        puts "2nd law  (A U B) U C = A U (B U C) that is #{aub_uc_arr} = #{au_buc_arr}"

    end
    def getcommutative_law
        aub = self.getunion_array
        bua = @b_arr | @a_arr
        aib = self.getintersection_array(@a_arr,@b_arr)
        bia = self.getintersection_array(@b_arr,@a_arr)
        puts " Commutative  1st law  A+B = B+A that is #{aub} = #{bua}"
        puts " 2nd law  A.B =B.A that is #{aib} = #{bia}"
    end
    def get_results
        puts "A -#{@a_arr}"
        puts "B - #{@b_arr}"
        puts "C - #{@c_arr}"
        puts "U - #{@u_arr}"
        aunionb = self.getunion_array
        aintsb  = self.getintersection_array(@a_arr,@b_arr)
        acompl = self.getcompliment_array(@a_arr)
        cart_pr = self.getcartesian_array
        puts
        puts "A U B = #{aunionb}"
        puts
        puts "A ∩ B = #{aintsb}"
        puts
        puts "A' = #{acompl}"
        puts
        puts "cartesian product  =  #{cart_pr}"
        puts
        self.getcommutative_law
        puts
        self.getassociative_law
        puts
        self.getdmorgans_law
    end
end
set = Set.new([1,2,3,4,5,6], [1,2,3,10,47,89], [1,2,5,10,47,9,4])
set.get_results
