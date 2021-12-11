class Team
    attr_accessor :name
    attr_reader :names_array

    def initialize(name)
        @name = name
        @names_array = ["Leo", "James", "Frank", "Michael", "Eric", "Richard"]
        
    end

    def substitution(input)
        @names_array.push(input)
        # team.map { |name| name == input_1 ? 'input_2' : name }
        # return team
    end
end