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
        run_arr = [0,1,2,4,6,7]
        runs = 0
        wickets = 0
        balls = 1
        results = {}
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
            
            r = run_arr.shuffle.first
                if r == 0

                    puts "#{batting_now_name} Out!"
                    puts "-------------"
                    puts "Total runs of #{batting_now_name} #{bat_man_run_arr[batting_now_name]}"
                    bat_team_arr.delete(batting_now_name)
                    wickets = wickets.to_i + 1
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
                    # puts "----------debug startsss"
                    # puts i
                    # puts r
                    # puts "----------debug ends//////////"
                    puts "Wow ! #{batting_now_name} Scored #{r} Runs \n"
                    # runs doubling for captains
                    if batting_now_name == bat_team_captain
                        r = r * 2
                    end
                    runs = runs.to_i + r
                    bat_man_run_arr[batting_now_name] = bat_man_run_arr[batting_now_name].to_i + r
                    puts "Total runs of #{batting_now_name} #{bat_man_run_arr[batting_now_name]}"

                 end
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
        results['players_wicket_score'] = bowl_man_wicket_arr
        results['bat_team_name'] = bat_team_name
        results['bowl_team_name'] = bowl_team_name
       
        return results
    end
    def prepare_results(innings,is_complete=0)
        create_scorecard(innings,@match_type,is_complete)
    end

end