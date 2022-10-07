require 'Matrix'

class Player
    attr_accessor :name
    attr_reader :mark
    attr_accessor :games_won
    @@count = 0

    def initialize(name)
        @name = name
        @games_won = 0

        @@count == 0 ? @mark = "X" : @mark = "O"
        @@count += 1
    end
end

class Game
    attr_reader :players
    attr_accessor :current_player

    def initialize(player_one_name, player_two_name)
        @players = []
        @players << Player.new(player_one_name)
        @players << Player.new(player_two_name)
        @current_player = players[0]
        
        @board = setup_board
    end

    def setup_board()
        result = Array.new(3) { Array.new(3) { "-" } }
        
        (1..9).each do |num|
            res = translate_input(num)
            result[res[0]][res[1]] = num
        end 
        result
    end

    def print_board()
        puts "\nThe board currently looks like this:"

        @board.each_with_index do |line, rows| 
            line.each_with_index do |val, columns|
            print " #{val} "
            columns < 2 ? print("|") : print("")
            end
            
            rows < 2 ? puts("\n--- --- ---\n") : puts("")
        end
    end

    def place_input(input)
        board_location = translate_input(input)
        tile = @board[board_location[0]][board_location[1]]

        if (tile == "X" || tile == "O")
            return false
        else 
            @board[board_location[0]][board_location[1]] = current_player.mark
            return true
        end
    end

    def translate_input(input)
        ((input.to_i) - 1).divmod(3)
    end
    
    def check_for_win()
        m = Matrix.rows(@board)

        m.each_with_index do |e, row, col|
            return true if m.row(row).all?("X") || m.row(row).all?("O")
        end
    end

    def play
        legal_move = false

        while(legal_move == false)
            print "\nPlayer #{current_player.name} where would you like to place an \"#{current_player.mark}\" [0-9]? "
            user_input = gets.chomp().downcase()
            if (place_input(user_input))
                toggle_player()
                legal_move = true
            else 
                puts "Illegal move. Please try again."
                print_board()
            end
        end
    end

    def toggle_player
        if @current_player == players[0]
            @current_player = players[1]
        else
            @current_player = players[0]
        end
    end
end

def runtime()
    current_game = nil

    while(current_game == nil)
        print "Ready to play [Y/N]? "
        user_input = gets.chomp().downcase()

        if (user_input == "n") then
            exit(0)
        end

        if (user_input == "y")
            print "Type a name for player one: "
            player_one_name = gets.chomp()

            print "Type a name for player two: "
            player_two_name = gets.chomp()

            current_game = Game.new(player_one_name, player_two_name)
        else 
            print "I didn't understand. Do you want to play a game [Y/N]? "
        end
    end

    while (current_game)
        current_game.print_board
        current_game.play

        if current_game.check_for_win == true
            puts "🎉!! Player #{current_game.current_player.name} won!"
            current_game.current_player.games_won += 1
            print "Do you want to play again [Y/N]? "
            input = gets.chomp().downcase()

            if (input == "y")
                current_game = nil
            else
                puts "Goodbye!"
                current_game = false
            end
        end 
    end
end

puts "Welcome to Tic Tac Toe!"
runtime()

# game doesn't properly restart?
# doesn't check for diagonals
# can't end up in a draw (if all spots are taken)
# wrong player listed as winning (because we already advanced current_player)
# if you input nil, that'll transcribe as "9"