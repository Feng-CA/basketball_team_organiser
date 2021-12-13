require "colorize"
require "tty-prompt"
require_relative "./methods.rb"
require_relative "./classes/team.rb"
require_relative './validation-error.rb'

prompt = TTY::Prompt.new

team = Team.new("Test Team", "./data/team-list.txt")
team_array = team.names_array.clone
prompt.ask("Hello, what's your name?").colorize(:light_cyan)

#MENU SYSTEM
while true
    output_team_length(team.names_array.length)
    puts "Please select 1) for player substitution, select 2) for Random teams, select 3) to decide ball possession, select 4) to exit".colorize(:light_yellow)
    input = gets.chomp.to_i

    case input 
    when 1 
        puts "Player substitution option".colorize(:light_green)
        puts team.names_array.join(', ').colorize(:light_blue)
        team.substitution
    when 2 
        puts "Random Teams option".colorize(:light_blue)
            team.output_random_teams
    when 3 
        puts "Ball possession option".colorize(:light_magenta)
            team.output_coin_flip
    when 4
        if team_array.to_set != team.names_array.to_set
            save_file_option(team)
        end
        puts "Goodbye! See you next time.".colorize(:light_cyan)
        exit
    else
        puts "Please pick 1, 2, 3 or 4".colorize(:light_red)
    end
end