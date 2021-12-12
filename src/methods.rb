require_relative './validation-error.rb'
require_relative './classes/team.rb'


def output_team_length(size)
    case size
    when 0
        puts "The team is empty"
    when 1
        puts "The team only has one player."
    else
        puts "There are #{size} players in the team."
    end
end

def save_file_option(team)
    def yes_or_no(question)
        puts question
        input = gets.chomp
        if input.downcase != "yes" && input.downcase != "no"
            raise ValidationError.new("Please enter yes or no")
        end
        return input
    end

    begin
        answer = yes_or_no("The file has been altered, would you like to save?")
    rescue => e
        puts e.message
        retry
    end
    
    if answer.capitalize == "Yes"
        team.save
        puts "saved team names"
    end
end 