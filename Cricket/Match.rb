$LOAD_PATH << '.'
require 'Scoreboard'
class Match < Teaminfo
    include Scoreboard
    def initialize(match_type)
        @@match_type = match_type
        if @@match_type == 'ODI'
            @@total_balls = 3 * 6
        elsif @@match_type == 'T20'
            @@total_balls = 2 * 6
        else
            @@total_balls = 5 * 6
        end
        
    end
    def play_match(batting,bowlling,team_name,bat_team_captain,inning)
        bat_man_run_arr = {}
        bowl_man_wicket_arr = {}
        summary = {}
        summary_data = []
        run_arr = [0,1,2,4,6,7,8,9,10,11,12]
        runs = 0
        wickets = 0
        balls = 1
        results = {}
        bats_man_out_arr={}
        bats_man_faced_balls_arr={}
        bowl_runs_conceded = {}
        bowl_economy = {}
        bats_man_strike_rate = {}
        bat_team_arr =  batting.dup
        batting_now = bat_team_arr[0..1]
        bat_team_name = team_name
        bowl_team_name = team_name=='Team 1' ? 'Team 2': 'Team 1'
        
        bowl_team_arr = bowlling
        # choose bowller and set the wickets as o 
        bowlling_now = bowl_team_arr.shuffle.first
        bowl_man_wicket_arr[bowlling_now] = 0

       for i in 1..@@total_balls
            if i.odd?
               batting_now_name = batting_now.first
            else
                batting_now_name = batting_now.last
            end
            if batting_now_name!='' && !(bat_man_run_arr.include? batting_now_name)

                bat_man_run_arr[batting_now_name] = 0
                
            end
            if batting_now_name!='' && !(bats_man_faced_balls_arr.include? batting_now_name)

                bats_man_faced_balls_arr[batting_now_name] = 0
                
            end
            if !(bowl_runs_conceded.include? bowlling_now)

                bowl_runs_conceded[bowlling_now] = 0
                
            end
            
            r = run_arr.shuffle.first
                if r == 0 || r >=8

                    puts "#{batting_now_name} Out!"
                    puts "-------------"
                    puts "Total runs of #{batting_now_name} #{bat_man_run_arr[batting_now_name]}"
                    bat_team_arr.delete(batting_now_name)
                    wickets = wickets.to_i + 1
                    bats_man_out_arr[batting_now_name] = self.get_out_mode(r)
                    bowl_man_wicket_arr[bowlling_now] = bowl_man_wicket_arr[bowlling_now].to_i + 1
                    batting_now = bat_team_arr[0..1]
                    if bat_team_arr == []  
                        puts "Innings #{inning} End"
                        puts "--------------------------"
                        puts "#{runs} Runs for #{bat_team_name} in #{balls} Balls\n\n"
                        puts " #{wickets} Wickets for #{bowl_team_name} in #{balls} Balls"
                    end
                    if batting_now == []
                        puts "Innings #{inning} End"
                        puts "--------------------------"
                        puts "#{runs} Runs for #{bat_team_name} in #{balls} Balls \n\n"
                        puts " #{wickets} Wickets for #{bowl_team_name} in #{balls} Balls"
                    end
                elsif r == 7
                    puts "That is a no ball"
                else
                    puts "Wow ! #{batting_now_name} Scored #{r} Runs \n"
                    # runs doubling for captains
                    if batting_now_name == bat_team_captain
                        r = r * 2
                    end
                    runs = runs.to_i + r
                    bat_man_run_arr[batting_now_name] = bat_man_run_arr[batting_now_name].to_i + r
                    bowl_runs_conceded[bowlling_now] = bowl_runs_conceded[bowlling_now].to_i + r
                    bowl_economy[bowlling_now] = self.calculate_bowling_economy(bowl_runs_conceded[bowlling_now],bowl_man_wicket_arr[bowlling_now] )
                    puts "Total runs of #{batting_now_name} #{bat_man_run_arr[batting_now_name]}"

                 end
                 bats_man_faced_balls_arr[batting_now_name] = bats_man_faced_balls_arr[batting_now_name] + 1
                 bats_man_strike_rate[batting_now_name] = self.calculate_run_rate(bats_man_faced_balls_arr[batting_now_name], bat_man_run_arr[batting_now_name])
                 if i== @@total_balls
                    puts "Innings  #{inning} End"
                    puts "--------------------------\n\n"
                    puts "#{runs} Runs for #{bat_team_name} in #{balls} Balls \n\n"
                    puts "#{wickets} Wickets for #{bowl_team_name} in #{balls} Balls"
                 end
                 if bat_team_arr == []  
                    puts "Innings #{inning} End"
                    puts "--------------------------"
                    puts "#{runs} Runs for #{bat_team_name} in #{balls} Balls\n\n"
                    puts " #{wickets} Wickets for #{bowl_team_name} in #{balls} Balls"
                    break
                end
                 balls = balls + 1
                 if i % 6 == 0
                    summary['innings'] = "Innings #{inning}"
                    summary['total_runs_scored'] = runs
                    summary['total_wickets'] = wickets
                    summary['players_runs_score'] = bat_man_run_arr
                    summary['players_strike_rate'] = bats_man_strike_rate
                    summary['bowl_player_economy'] = bowl_economy
                    summary['players_out_mode'] = bats_man_out_arr
                    summary['players_wicket_score'] = bowl_man_wicket_arr
                    summary['bat_team_name'] = bat_team_name
                    summary['bowl_team_name'] = bowl_team_name
                    summary_data = [summary]
                    self.prepare_results(summary_data,0)
                    bowlling_now = bowl_team_arr.shuffle.first
                    if !(bowl_man_wicket_arr.include? bowlling_now)
                        bowl_man_wicket_arr[bowlling_now] = 0
                    end
                 end

        end
        results['innings'] = "Innings #{inning}"
        results['total_runs_scored'] = runs
        results['total_wickets'] = wickets
        results['players_runs_score'] = bat_man_run_arr
        results['players_out_mode'] = bats_man_out_arr
        results['bowl_player_economy'] = bowl_economy
        results['players_strike_rate'] = bats_man_strike_rate
        results['players_wicket_score'] = bowl_man_wicket_arr
        results['bat_team_name'] = bat_team_name
        results['bowl_team_name'] = bowl_team_name
        return results
    end
    def prepare_results(innings,is_complete=0)
        create_scorecard(innings,@match_type,is_complete)
    end
    def get_out_mode(r)
        case r
        when 0
            mode = 'LBW'
            
        when 8
            mode = 'Caught behind'
        when 9
            mode = 'Stumping'
        when 10
            mode = 'Runout'
        when 11
            mode = 'Catch out'
        else
            mode = 'Bold'
        end
        return mode
    end
    def calculate_run_rate(balls,runs)
        run_rate = (runs * 100) / balls
        return run_rate
    end
    def calculate_bowling_economy(runs,wickets)
        if(wickets==0 || runs ==0)
            economy = 0
        else
            economy = runs / wickets
        end
       
        return economy
    end
end