module Scoreboard
    def create_scorecard(innings,match_type,is_complete=0)
        if File.exists?('score.txt')
            File.open('score.txt', "w+") do |f| 
            f.puts "Match End \n" if is_complete!=0 
            f.puts "Match Info \n" if is_complete ==0
            f.puts "-------------------\n\n"
            f.puts "|Innings | Team | Runs | Wickets"
           f.puts "---------------------------------"
            innings.each do |value|
                
            f.puts "|#{value['innings']}| #{value['bat_team_name']} | #{value['total_runs_scored']} | #{value['total_wickets']}"

            end
           f.puts "\n\n"
            innings.each do |value|
                f.puts "#{value['innings']}  Batting Summary\n\n"
                f.puts "-----------------------------------"
                f.puts "|Player | Runs | Out | Strike rate |"
                f.puts "-----------------"
                value['players_runs_score'].each do |key,pl|
                    value['players_out_mode'][key]= value['players_out_mode'][key] ? value['players_out_mode'][key] : 'Not Out'
                    value['players_strike_rate'][key]= value['players_strike_rate'][key].to_f ? value['players_strike_rate'][key] : 0
                    f.puts "|#{key}| #{pl} | #{value['players_out_mode'][key]} |  #{value['players_strike_rate'][key]}"
                end
                f.puts "\n\n"
            end
            f.puts "\n\n"
            f.puts "\n\n"
            innings.each do |value|
                f.puts "#{value['innings']}  Bowlling Summary\n\n"
                f.puts "-----------------------------------"
                f.puts "|Player | wickets | "
                f.puts "-----------------"
                value['players_wicket_score'].each do |key,pl|
                    f.puts "|#{key}| #{pl} "
                end
                f.puts "\n\n"
            end
            f.puts "\n\n"
            if(is_complete!=0)
            if match_type!='Test'
                if innings[0]['total_runs_scored'] > innings[1]['total_runs_scored']
                    diff = innings[0]['total_runs_scored'].to_i - innings[1]['total_runs_scored'].to_i
                    f.puts "#{innings[0]['bat_team_name']} Won the match by #{diff}  runs!"
                else
                    diff = innings[1]['total_runs_scored'].to_i - innings[0]['total_runs_scored'].to_i
                    f.puts "#{innings[1]['bat_team_name']} Won the match by #{diff}  runs!"
                end
            else
                team_first_total_runs = innings[0]['total_runs_scored'].to_i + innings[2]['total_runs_scored'].to_i
                team_second_total_runs = innings[1]['total_runs_scored'].to_i + innings[3]['total_runs_scored'].to_i
                if team_first_total_runs > team_second_total_runs
                    diff = team_first_total_runs - team_second_total_runs
                    f.puts "#{innings[0]['bat_team_name']} Won the match by #{diff}  runs!"
                else
                    diff = team_second_total_runs - team_first_total_runs
                    f.puts "#{innings[1]['bat_team_name']} Won the match by #{diff}  runs!"
                end
            end
            end
        end
    end
    self.display_final
    end
    def display_final()
        if File.exists?('score.txt')
            f = File.open('score.txt','r+')
            puts f.read
            f.close
        end
    end
end