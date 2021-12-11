require "colorize"
require "tty-prompt"

prompt = TTY::Prompt.new

#MENU SYSTEM
while true
    puts "Pick 1) for substitution , Pick 2) for Random teams, Pick 3) to decide ball possession, Pick 4) to exit"
    input = gets.chomp.to_i
    case input 
    when 1 
        puts "Substituted Player option"
    when 2 
        puts "Selected Random Teams option"
    when 3 
        puts "Decided ball possession option"
    when 4
        puts "Goodbye"
        exit
    else
        puts "Please pick 1, 2, 3 or 4"
    end
end