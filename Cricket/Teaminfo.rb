class Teaminfo
  def initialize(t1, t2)
    @@t1 = t1
    @@t2 = t2
    @@coins = ['Heads','Tails']

  end
  def choose_captain(t1c,t2c)
    @@t1c = t1c
    @@t2c = t2c
  end
  def coin_toss(t1side,t2side)
    team = []
    if @@coins.shuffle.first==t1side
      team = {"bat_team"=>@@t1,"bowl_team"=>@@t2,"coin_won"=>"Team 1","bat_team_name"=>"Team 1","bowl_team_name"=>"Team 2"}
    else
      team = {"bat_team"=>@@t2,"bowl_team"=>@@t1,"coin_won"=>"Team 2","bat_team_name"=>"Team 2","bowl_team_name"=>"Team 1"}
    end
    return team
  end
end
