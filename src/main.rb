require "colorize"
require "tty-prompt"
require "artii"
require 'date'
require_relative "./methods.rb"
require_relative "./classes/team.rb"
require_relative './validation-error.rb'

prompt = TTY::Prompt.new
current_datetime = DateTime.now
current_datetime.strftime "%d/%m/%Y %H:%M"
puts "Current time : #{current_datetime.strftime "%d/%m/%Y %H:%M"}".colorize(:light_yellow)
puts "\n\n"
artii = Artii::Base.new()
puts artii.asciify('Basketball Team Organiser').colorize(:light_blue)


if ARGV.length > 0
    flag, *rest = ARGV
    ARGV.clear
    case flag
    when '-help'
        puts "-@                              print the copyright"
        puts "-info                           show the required ruby version to run this app"
        puts "-p                              show the default file path"
        puts "-path ./data/{filename}.txt     open an existing file or create a new file ({Filename} to be replaced by your own file name)"
        puts "-help                           show this message"
        exit
    when '-info'
        puts "This program is running ruby #{RUBY_VERSION}.".colorize(:light_cyan)
    when '-@'
        puts "This application is created by Feng Mao.".colorize(:light_green)
    when '-p'
        puts "Default path is : ./data/team-list.txt".colorize(:light_yellow)
    when '-path'
        team = Team.new(rest[1] ||= "Default Team", rest[0])
    else
        puts "Invalid argument, please check README documentation.".colorize(:light_red)
        exit
    end
end

team ||= Team.new("Test Team", "./data/team-list.txt")
team_array = team.names_array.clone
answer = prompt.ask("Hello, what's your name?".colorize(:light_cyan))

#MENU SYSTEM
while true
    output_team_length(team.names_array.length)
    puts "#{answer.capitalize}.Please select 1) for player substitution, select 2) for Random squads, select 3) to decide ball possession, select 4) to exit".colorize(:light_yellow)
    input = gets.chomp.to_i

    case input
    when 1 
        puts "Player substitution option".colorize(:light_green)
        puts team.names_array.join(', ').colorize(:light_blue)
        team.substitution
    when 2 
        puts "Random squads option".colorize(:light_blue)
            team.output_random_squads
    when 3 
        puts "Ball possession option".colorize(:light_magenta)
            team.output_coin_flip
    when 4
        if team_array.to_set != team.names_array.to_set
            save_file_option(team)
        end
        puts artii.asciify('Goodbye! See you next time.').colorize(:light_cyan)
        exit
    else
        puts "Please pick 1, 2, 3 or 4".colorize(:light_red)
    end
end