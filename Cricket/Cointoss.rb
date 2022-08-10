class Cointoss
    def initialize(t1,t2)
        @t1 = t1
        @t2 = t2
        @coins = ['Heads','Tails']
    end
    def choose_captain(t1c,t2c)
        @t1c = t1c
        @t2c = t2c
      end
    def coin_toss(t1side,t2side)
        coin_info = []
        if @coins.shuffle.first==t1side
          @bat_team = @t1
          @bat_captain = @t1c
          @bowl_team = @t2
          @bowl_captain = @t2c
          return 'Team 1'
        else
          @bat_team = @t2
          @bat_captain = @t2c
          @bowl_team = @t1
          @bowl_captain = @t1c
          return 'Team 2'
        end
    end
    def get_batting_team()
        return @bat_team
      end
      def get_bowling_team()
        return @bowl_team
      end
      def get_batting_team_captain()
        return @bat_captain
      end
      def get_bowling_team_captain()
        return @bowl_captain
      end
    
end