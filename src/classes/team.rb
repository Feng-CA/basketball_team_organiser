require "colorize"
require "tty-prompt"
prompt = TTY::Prompt.new
require_relative '../validation-error.rb'
class Team
    attr_accessor :name
    attr_accessor :names_array

    def initialize(name, file_path)
        @name = name
        @file_path = file_path
        @names_array = self.path_to_list 
    end

    def delete_name(input)
        begin
            puts "Please type the name of the player to delete:".colorize(:light_yellow)
            input = gets.chomp.capitalize
            unless @names_array.include? input
                raise ValidationError.new("Please type the corrent name of the player to delete:")
            end
        rescue => e
            until @names_array.include? input do
                puts e.message.colorize(:light_red)
                input = gets.chomp.capitalize 
            end
        end

        @names_array.delete(input)
    end

    def add_name(input)
        begin
            puts "Please type the name of the player to add:".colorize(:light_green)
            input = gets.chomp.capitalize
            if @names_array.include? input
                raise ValidationError.new("Sorry, we already have the same name, please include the last name initial of the player to add:")
            end
        rescue => e
            while @names_array.include? input do
                puts e.message.colorize(:light_red)
                input = gets.chomp.capitalize 
            end  
        end
        @names_array.push(input)
     
        puts "The players are ".colorize(:light_blue) + @names_array.join(', ').colorize(:light_cyan)  
    end

    def substitution
        delete_name(name)
        add_name(name)
    end

    def random_name_order
        @names_array.shuffle
    end 

    def output_random_squads
        output_squad_order = random_name_order.each_slice(5).to_a
        squad_one = output_squad_order[0].join(', ')
        squad_two = output_squad_order[1].join(', ')
        squad_three = output_squad_order[2].join(', ')
        table = TTY::Table.new(["squad numbar","player names"], [["1", squad_one], ["2", squad_two], ["3", squad_three]])
        puts table.render(:ascii).colorize(:light_green)
        puts "Squad 1 and Squad 2 will be on the floor first. Squad 3 will be on the bench.".colorize(:light_cyan)   
    end 

    def coin_flip
        
        begin
            puts "Let's play coin flipping. Please choose 0 for heads or 1 for tails. The winner will get the ball.".colorize(:light_cyan)
            answer = Integer(gets.chomp)
            if answer != 0 && answer != 1
                raise ValidationError.new("Please only enter 0 or 1")
            end
            return answer
        rescue ArgumentError
            puts "Please enter only numbers.".colorize(:light_red)
            retry
        rescue => e
            puts e.message.colorize(:light_red)
            retry
        ensure
            puts "This is a valid guess.".colorize(:light_cyan)
        end
    end

    def output_coin_flip
        if coin_flip == [0, 1, 0, 1, 0, 1].sample
            puts "Congratuations! You get the ball!".colorize(:light_green)
        else 
            puts "Sorry! Good luck next time.".colorize(:light_yellow)
        end
    end

    def save
        File.open(@file_path, "w+") do |file| 
                file.puts(@names_array)
        end 
    end 

    private 

    def path_to_list
        begin
            list_array = File.readlines(@file_path).map(&:strip)
        rescue
            puts "Invalid path! Just creating a new file for you.".colorize(:light_red)
            pp @file_path
            File.open(@file_path, "w") do |file| 
                file.write("")
            
                list_array = []
               
                until list_array.length == 15 do
                puts "Please add player name:"
                input = String(gets.chomp).capitalize
                
                if list_array.include? input
                    puts "Sorry, we already have the same name, please include the last name initial of the player to add:".colorize(:light_red)
                else
                    list_array << input
                end

                end

            end
        end

        File.open(@file_path, "w+") do |file| 
            file.puts(list_array)
        end
        return list_array
       
    end 
    
end