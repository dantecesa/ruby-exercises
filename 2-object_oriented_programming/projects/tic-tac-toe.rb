require 'Matrix'

class String
    def colorize(color_code)
      "\e[#{color_code}m#{self}\e[0m"
    end
  
    def red
      colorize(31)
    end
  
    def blue
      colorize(34)
    end
end

class Player
    attr_accessor :name, :mark, :games_won
    @@total_num_players = 0

    def initialize(name)
        self.name = name
        self.games_won = 0

        self.mark = @@total_num_players % 2 == 0 ? Tile::X : Tile::O
        @@total_num_players += 1
    end
end

class Tile
    X = "X".red
    O = "O".blue
end

class Board
    attr_accessor :board

    def initialize(size)
        self.board = Array.new(size) { Array.new(size) { "-" } }

        (1..9).each do |num|
            coordinate = translate_input_to_tile(num)
            self.board[coordinate[0]][coordinate[1]] = num
        end 

        board
    end

    def to_s
        puts ""
        @board.each_with_index do |line, rows| 
            line.each_with_index do |val, columns|
            print " #{val} "
            columns < 2 ? print("|") : print("")
            end
            
            rows < 2 ? puts("\n---+---+---\n") : puts("")
        end
        puts ""
    end

    def translate_input_to_tile(input)
        ((input.to_i) - 1).divmod(3)
    end

    def attempt_save_at(input, current_player)
        coordinates = translate_input_to_tile(input)

        tile = board[coordinates[0]][coordinates[1]]
        
        if (tile == Tile::X || tile == Tile::O)
            return false
        else 
            board[coordinates[0]][coordinates[1]] = current_player.mark
            return true
        end
    end
end

class Game
    attr_accessor :players, :current_player, :num_moves, :board

    def initialize(player1, player2)
        self.players = [player1, player2]
        self.current_player = players[0]
        
        self.board = Board.new(3)
        @num_moves = 0
    end

    def reset
        self.board = Board.new(3)
        self.toggle_current_player
        @num_moves = 0
    end

    def place_input(input)
        board.attempt_save_at(input, current_player)
    end
    
    def check_for_win
        rows = Matrix.rows(@board.board)
        rows.each_with_index do |e, row, col|
            return true if rows.row(row).all?(Tile::X) || rows.row(row).all?(Tile::O)
        end

        columns = Matrix.rows(@board.board)
        columns.each_with_index do |e, row, col|
            return true if columns.column(col).all?(Tile::X) || columns.column(col).all?(Tile::O)
        end

        return true if check_left_to_right_diagonal
        return true if check_right_to_left_diagonal
    end

    def check_left_to_right_diagonal
        result = (0..2).map { |val| @board.board[val][val]}
        return true if result.all?(Tile::X) || result.all?(Tile::O)
    end

    def check_right_to_left_diagonal
        result = (0..2).map { |val| @board.board[val][2 - val]}
        return true if result.all?(Tile::X) || result.all?(Tile::O)
    end

    def valid_input?(input)
        true if input =~ /[1-9]/ && input.length == 1
    end

    def play
        legal_move = false

        if @num_moves == 9
            puts "😞 looks like we have a draw!"
            puts ""
            ask_to_play_again(self)
        end

        while(legal_move == false)
            print "\nPlayer #{current_player.name}, where would you like to place an \"#{current_player.mark}\" [1-9]? "
            
            user_inputted_tile = gets.chomp.downcase

            if (valid_input?(user_inputted_tile) && place_input(user_inputted_tile))
                if check_for_win == true
                    clear_terminal
                    puts "Player #{current_player.name} won 🎉!"
        
                    puts ""
                    board.to_s
                    puts ""
        
                    current_player.games_won += 1
                    ask_to_play_again(self)
                else
                    toggle_current_player
                    legal_move = true
                    @num_moves += 1
                    self
                end
            else 
                clear_terminal
                puts "Illegal move.".red + " Please try again."
                board.to_s
                self
            end
        end
        self
    end

    def toggle_current_player
        if @current_player == players[0]
            @current_player = players[1]
        else
            @current_player = players[0]
        end
    end
end

def ask_to_play_again(current_game)
    print "Do you want to play again [Y/N]? "
    input = gets.chomp.downcase

    if (input == "y")
        current_game.reset
        clear_terminal
        current_game.board.to_s
    elsif (input == "n")
        puts "Goodbye!" 
    else
        puts "I didn't understand. Do you want to play another game [Y/N]? "
    end
end

def runtime
    current_game = nil

    while(current_game == nil)
        print "Ready to play [Y/N]? "
        user_input = gets.chomp.downcase

        if (user_input == "n") then
            exit(0)
        end

        if (user_input == "y")
            clear_terminal
            print "Type a name for player one: ".red
            player_one_name = gets.chomp
            player1 = Player.new(player_one_name)
            
            clear_terminal
            print "Type a name for player two: ".blue
            player_two_name = gets.chomp
            player2 = Player.new(player_two_name)
            
            clear_terminal
            current_game = Game.new(player1, player2)
        else 
            print "I didn't understand. Do you want to play a game [Y/N]? "
        end
    end

    while current_game
        current_game.board.to_s
        current_game = current_game.play
        clear_terminal
    end
end

def clear_terminal
    puts "\e[H\e[2J"
end

clear_terminal
puts "Welcome to " + "Tic Tac Toe!".blue
runtime