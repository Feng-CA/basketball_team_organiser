require_relative "../classes/team.rb"

describe 'Team' do

    before(:each) do
        @test_team = Team.new("Test Team")
    end

    describe ".substitution" do 
        it "should be defined" do 
            expect(defined? @test_team.substitution).to eq("method")
        end

        it "should has same number of players as @names_array" do 
            length = @test_team.names_array.length
            @test_team.substitution("Leo", "Jason")
            expect(@test_team.names_array.length).to eq(length)
        end 
    end

    describe ".random_name_order" do
        it "should be defined" do
            expect(defined? @test_team.random_name_order).to eq("method")
        end

        it "should return an array" do
            expect(@test_team.random_name_order). to be_an_instance_of(Array)
        end
    end
end