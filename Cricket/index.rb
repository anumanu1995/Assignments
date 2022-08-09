$LOAD_PATH << '.'
require 'Teaminfo'
require 'Match'
t1 = ['Anu','Asha','Aksa','Sam','Malu','Sumol']
t2 = ['sijo','Eldhose','neethu','Bincy','Paul','Manju']
t1c = 'Anu'
t2c = 'neethu'
t1side = 'Heads'
t2side = 'Tails'
m1type = 'Test'
m2type = 'ODI'
m3type = 'T20'

teaminfo = Teaminfo.new(t1,t2)
teaminfo.choose_captain(t1c,t2c)
matchinfo = Match.new(m3type)
team = teaminfo.coin_toss(t1side,t2side)
matchinfo.play_match(team,1)
# puts "#{m3type} Match 20200"
# puts "--------------------------------"
# puts "Team 1 #{t1.join(",")}  & captain #{t1c}\n\n"
# puts "Team 2 #{t2.join(",")}   & captain #{t2c} \n\n"
# puts "-------------------------------"
# puts "Coin tossed \n\n"
# puts "#{team['coin_won']} won the toss and selected to bat first \n\n"
# puts "Innings starting ................"


