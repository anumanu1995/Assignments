class Match < Teaminfo
    def initialize(match_type)
        @@match_type = match_type
        if @@match_type == 'ODI'
            @@total_balls = 5 * 6
        elsif @@match_type == 'T20'
            @@total_balls = 3 * 6
        end
        
    end
    def play_match(team,innings)
        bat_man_run_arr = []
        bowl_man_wicket_arr = []
        run_arr = [1,2,4,6,7]
        runs = 0
        wickets = 0
        balls = 0
        bat_team_arr = team['bat_team']
        batting_now = bat_team_arr[0..1]
        # creating array for batmans runs
        bat_man_run_arr=Hash[*bat_team_arr.zip(bat_team_arr).flatten]
        bat_man_run_arr[batting_now[0]] = 0
        bat_man_run_arr[batting_now[1]] = 0
        
        bowl_team_arr = team['bowl_team']
        bowlling_now = bowl_team_arr[0]
        # creating array for bowllers wickets
        bowl_man_wicket_arr =Hash[*bowl_team_arr.zip(bowl_team_arr).flatten]
        bowl_man_wicket_arr[bowlling_now] = 0

       for i in 1..@@total_balls
            puts i
            if i.odd?
               batting_now_name = batting_now.first
            else
                batting_now_name = batting_now.last
            end
            r = run_arr.shuffle.first
                if r == 0

                    puts "#{batting_now_name} Out!"
                    puts "-------------"
                    puts "Total runs of #{batting_now_name} #{bat_man_run_arr[batting_now_name]}"
                    bat_team_arr.delete(batting_now_name)
                    puts bat_team_arr
                    wickets = wickets.to_i + 1
                    bowl_man_wicket_arr[bowlling_now] = bowl_man_wicket_arr[bowlling_now].to_i + 1
                    batting_now = bat_team_arr[0..1]
                    if bat_team_arr == []  
                        puts "Innings End"
                        puts "--------------------------"
                        puts "#{runs} Runs for #{team['bat_team_name']} in #{balls} Balls\n\n"
                        puts " #{wickets} Wickets for #{team['bowl_team_name']} in #{balls} Balls"
                    end
                    if batting_now == []
                        puts "Innings End"
                        puts "--------------------------"
                        puts "#{runs} Runs for #{team['bat_team_name']} in #{balls} Balls \n\n"
                        puts " #{wickets} Wickets for #{team['bowl_team_name']} in #{balls} Balls"
                    end
                elsif r == 7
                    puts "That is a no ball"
                else
                    puts "Wow ! #{batting_now_name} Scored #{r} Runs \n"
                    runs = runs.to_i + r
                    bat_man_run_arr[batting_now_name] = bat_man_run_arr[batting_now_name].to_i + r 
                    puts "Total runs of #{batting_now_name} #{bat_man_run_arr[batting_now_name]}"

                 end
                 if i== @@total_balls
                    puts "Innings End"
                    puts "--------------------------\n\n"
                    puts "#{runs} Runs for #{team['bat_team_name']} in #{balls} Balls \n\n"
                    puts "#{wickets} Wickets for #{team['bowl_team_name']} in #{balls} Balls"
                 end
                 balls = balls + 1

        end
         return runs
        



    end

end