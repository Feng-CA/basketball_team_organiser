class Team
    attr_accessor :name
    attr_reader :names_array

    def initialize(name)
        @name = name
        @names_array = ["Leo", "James", "Frank", "Michael", "Eric", "Richard"]
        
    end

    def substitution(input_1, input_2)

        # if @names_array.include? (input_1)
        #     begin
        #         puts "#{input_1} is on our team list."
        #         @names_array.delete(input_1)
        #     rescue ArgumentError
        #         puts "Please check your typing"
        #         retry
        #     end
        # end

        until @names_array.include? input_1 do
            puts "Plese type the correct name of the player to delete:"
            input_1 = gets.chomp.capitalize   
        end
        @names_array.delete(input_1)
        @names_array.push(input_2)
        # update_array = @names_array.map { |name| name == input_1 ? input_2 : name }
        return @names_array
    end
end