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