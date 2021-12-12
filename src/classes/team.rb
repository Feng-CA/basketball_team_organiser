require "tty-prompt"
prompt = TTY::Prompt.new
require_relative '../validation-error.rb'
class Team
    attr_accessor :name
    attr_reader :names_array

    def initialize(name)
        @name = name
        @names_array = ["Leo", "James", "Frank", "Michael", "Eric", "Richard", "Min", "Nick", "Feng", "Will", "Kevin", "Eason", "Ban", "Philip", "Xiao"]
        
    end

    def substitution(input_1, input_2)
        until @names_array.include? input_1 do
            puts "Plese type the correct name of the player to delete:"
            input_1 = gets.chomp.capitalize   
        end
        @names_array.delete(input_1)
        @names_array.push(input_2)
        # update_array = @names_array.map { |name| name == input_1 ? input_2 : name }
        return @names_array.join(', ')
        # puts "Our team players are #{@names_array.join(', ')}."
    end

    def random_name_order
        @names_array.shuffle
    end 

    def output_random_teams
        output_name_order = random_name_order
        team_one = output_name_order[0..4]
        puts "Team one players are #{team_one.join(', ')}."
        team_two = output_name_order[5..9]
        puts "Team two players are #{team_two.join(', ')}."
        team_three = output_name_order[10...15]
        puts "Team three players are #{team_three.join(', ')}."
        puts "Team one and team two will be on the floor first. Team three will be on the bench."   
    end 

    def coin_flip
        
        begin
            puts "Please choose 0 for heads or 1 for tails."
            answer = Integer(gets.chomp)
            if answer != 0 && answer != 1
                raise ValidationError.new("Please enter 0 or 1")
            end
            return answer
        rescue ArgumentError
            puts "Please enter only numbers."
            retry
        rescue => e
            puts "Please only enter 0 or 1."
            retry

        # pp answer
        ensure
            puts "This is a valid number."
        end
    end

    def output_coin_flip
        if coin_flip == [0, 1].sample
            puts "You are the winner!"
        else 
            puts "Sorry! Good luck next time."
        end
    end
    
end