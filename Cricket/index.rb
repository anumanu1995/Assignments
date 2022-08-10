$LOAD_PATH << '.'
require 'Teaminfo'
require 'Match'
require 'Scoreboard'
Teams = ['Team 1','Team 2']
t1 = ['Sachin','Dhoni','Sewang','Ashish','Rohith','Kohli','Yuvraj','Raina','Dravid','Aswin','Goutham']
t2 = ['Simon','Adam','Andrew','Watson','Brad','Ben','Philip','Graham','Nathan','Pat','Alex']
puts "Choose captain for Team 1 \n "
puts "-----------------"
puts t1
t1c = gets.chomp.to_s
if !(t1.include? t1c)
    puts "Invalid input for captain, exiting.."
end
puts "Choose captain for Team 2 \n"
puts "-----------------"
puts t2
t2c = gets.chomp.to_s
if !(t2.include? t2c)
    puts "Invalid input for captain, exiting.."
end
puts "Choose coin side for Team 1 from 1=>Heads ,2=>Tails"
puts "-----------------"
t1side = gets.chomp.to_i
if !([1,2].include? t1side)
    puts "Invalid input for coin side ,exiting.."
end
t1side = t1side==1 ? 'Heads' : 'Tails'
t2side = t1side=='Heads' ? 'Tails': 'Heads'
puts "Choose the match type from Test,ODI,T20"
puts "-----------------"
mtype = gets.chomp.to_s
if !(['Test','ODI','T20'].include? mtype)
    puts "Invalid input for match type, exiting.."
end
innings = {}

teaminfo = Teaminfo.new(t1,t2)
teaminfo.choose_captain(t1c,t2c)
coin_won = teaminfo.coin_toss(t1side,t2side)
batting = teaminfo.get_batting_team
bowlling = teaminfo.get_bowling_team
captain = teaminfo.get_batting_team_captain
matchinfo = Match.new(mtype)
puts "#{mtype} Match 20200"
puts "--------------------------------"
puts "Team 1 #{t1.join(",")}  & captain #{t1c}\n\n"
puts "Team 2 #{t2.join(",")}   & captain #{t2c} \n\n"
puts "-------------------------------"
puts "Coin tossed \n\n"
puts "#{coin_won} won the toss and selected to bat first \n\n"
puts "Innings starting ................"
if(mtype =='T20' || mtype == 'ODI')
    inning1_results= matchinfo.play_match(batting,bowlling,coin_won,captain,1)
    team_name_bat = coin_won=='Team 1'? 'Team 2' : 'Team 1'
    captain = teaminfo.get_bowling_team_captain
    inning2_results= matchinfo.play_match(bowlling,batting,team_name_bat,captain,2)
    innings = [inning1_results,inning2_results]
else
    inning1_results= matchinfo.play_match(batting,bowlling,coin_won,captain,1)
    team_name_bat = coin_won=='Team 1'? 'Team 2' : 'Team 1'
    bowl_captain = teaminfo.get_bowling_team_captain
    inning2_results= matchinfo.play_match(bowlling,batting,team_name_bat,bowl_captain,2)
    inning3_results= matchinfo.play_match(batting,bowlling,coin_won,captain,3)
    inning4_results= matchinfo.play_match(bowlling,batting,team_name_bat,bowl_captain,4)
    innings = [inning1_results,inning2_results,inning3_results,inning4_results]
    

end

matchinfo.prepare_results(innings,1)


