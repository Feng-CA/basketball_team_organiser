require "colorize"
require "tty-prompt"
require_relative "./methods.rb"
require_relative "./classes/team.rb"
require_relative './validation-error.rb'

prompt = TTY::Prompt.new

team = Team.new("Test Team", "./data/team-list.txt")
team_array = team.names_array.clone
user_name = prompt.ask("Hello, what's your name?")
#MENU SYSTEM
while true
    output_team_length(team.names_array.length)
    puts "#{user_name.capitalize}, please select 1) for substitution , Pick 2) for Random teams, Pick 3) to decide ball possession, Pick 4) to exit"
    input = gets.chomp.to_i

    case input 
    when 1 
        puts "Substitute Player option".colorize(:green)
        puts team.names_array.join(', ')
        team.substitution
    when 2 
        puts "Random Teams option".colorize(:blue)
            team.output_random_teams
    when 3 
        puts "ball possession option".colorize(:yellow)
            team.output_coin_flip
    when 4
        if team_array.to_set != team.names_array.to_set
            save_file_option(team)
        end
        puts "Goodbye! See you next time.".colorize(:cyan)
        exit
    else
        puts "Please pick 1, 2, 3 or 4".colorize(:red)
    end
end