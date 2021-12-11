require "colorize"
require "tty-prompt"
require_relative "./methods.rb"
require_relative "./classes/team.rb"

prompt = TTY::Prompt.new

# team = ["Leo", "James", "Frank", "Michael", "Eric", "Richard"]
team = Team.new("Test Team")
#MENU SYSTEM
while true
    puts "Pick 1) for substitution , Pick 2) for Random teams, Pick 3) to decide ball possession, Pick 4) to exit"
    input = gets.chomp.to_i
    case input 
    when 1 
        puts "Substituted Player option".colorize(:green)
        puts "Type name of member to delete:"
        input_1 = gets.chomp.capitalize
        puts "Type name of member to add:"
        input_2 = gets.chomp.capitalize
        new_team = team.substitution(input_1, input_2)

        pp new_team
    when 2 
        puts "Selected Random Teams option".colorize(:blue)
    when 3 
        puts "Decided ball possession option".colorize(:yellow)
    when 4
        puts "Goodbye".colorize(:cyan)
        exit
    else
        puts "Please pick 1, 2, 3 or 4".colorize(:red)
    end
end