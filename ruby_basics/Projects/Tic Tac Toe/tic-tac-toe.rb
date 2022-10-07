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
    attr_accessor :num_moves

    def initialize(player1, player2)
        @players = [player1, player2]
        @current_player = players[0]
        
        @board = setup_board
    end

    def setup_board()
        result = Array.new(3) { Array.new(3) { "-" } }
        
        (1..9).each do |num|
            res = translate_input(num)
            result[res[0]][res[1]] = num
        end 
        @num_moves = 0
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
        rows = Matrix.rows(@board)
        rows.each_with_index do |e, row, col|
            return true if rows.row(row).all?("X") || rows.row(row).all?("O")
        end

        columns = Matrix.rows(@board)
        columns.each_with_index do |e, row, col|
            return true if columns.column(col).all?("X") || columns.column(col).all?("O")
        end

        return true if check_left_to_right_diagonal
        return true if check_right_to_left_diagonal
    end

    def check_left_to_right_diagonal
        result = (0..2).map { |val| @board[val][val]}
        return true if result.all?("X") || result.all?("Y")
    end

    def check_right_to_left_diagonal
        result = (0..2).map { |val| @board[val][2 - val]}
        return true if result.all?("X") || result.all?("Y")
    end

    def play
        legal_move = false

        while(legal_move == false)
            print "\nPlayer #{current_player.name} where would you like to place an \"#{current_player.mark}\" [0-9]? "
            
            user_input = gets.chomp().downcase()

            if (place_input(user_input))
                if check_for_win == true
                    puts "🎉!! Player #{current_player.name} won!"
        
                    print_board()
        
                    current_player.games_won += 1
                    return ask_to_play_again(self)
                else
                    toggle_player()
                    legal_move = true
                    @num_moves += 1
                    self
                end
            else 
                puts "Illegal move. Please try again."
                print_board()
                self
            end
        end
        self
    end

    def toggle_player
        if @current_player == players[0]
            @current_player = players[1]
        else
            @current_player = players[0]
        end
    end
end

def ask_to_play_again(current_game)
    old_game = current_game
    print "Do you want to play again [Y/N]? "
    input = gets.chomp().downcase()

    if (input == "y")
        current_game = Game.new(old_game.players[0], old_game.players[1])
    else
        puts "Goodbye!" 
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
            player1 = Player.new(player_one_name)
            
            print "Type a name for player two: "
            player_two_name = gets.chomp()
            player2 = Player.new(player_two_name)

            current_game = Game.new(player1, player2)
        else 
            print "I didn't understand. Do you want to play a game [Y/N]? "
        end
    end

    while (current_game)
        current_game.print_board
        current_game = current_game.play
        
        if current_game.num_moves == 9
            puts "😞 looks like we have a draw!"
            current_game = ask_to_play_again(current_game)
        end
    end
end

puts "Welcome to Tic Tac Toe!"
runtime()

# if you input nil, that'll transcribe as "9"