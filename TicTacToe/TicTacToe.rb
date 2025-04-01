class Board

    def initialize
        @board = [["A ", "| ", " ", "| ", " ", "| ", " "],
                  ["  -", "-", "-", "-", "-", "-", "---"],
                  ["B ", "| ", " ", "| ", " ", "| ", " "],
                  ["  -", "-", "-", "-", "-", "-", "---"],
                  ["C ", "| ", " ", "| ", " ", "| ", " "],
                  [" ", "  1", " ", "  2", " ", " 3", " "]]
    end

    def print_board
        @board.each { |x|
            puts x.join("")
        }
    end

    def place_token(x, y, token)
        @board[x][y] = token
        # dodelat hlidani aby policko bylo prazdne
    end
end


class Game

    def initialize
        @board = Board.new
        @player = "X"
    end

    def switch_players # switch players on every turn
        if @player == "X"
            @player = "O"
        else
            @player = "X"
        end
    end

    def check_for_winner # dodelat kontrolu konce hry
        false
    end

    def get_x(coordinates) # Map ABC to numbers
        case coordinates[0]
        when 'A', 'a'
            return 0
            #x = 0
        when 'B', 'b'
            return 2
            #x = 2
        when 'C', 'c'
            return 4
            #x = 4
        end
    end

    def get_y(coordinates)
        case coordinates[1]
        when '1'
            return 2
            #y = 2
        when '2'
            return 4
            #y = 4
        when '3'
            return 6
            #y = 6
        end
    end

    def start_game
        until check_for_winner
            @board.print_board
            puts("Player's #{@player} turn")
            while true
                puts("Enter coordinates (A1, B3...)")
                coordinates = gets
                if /^[ABCabc][123]$/.match(coordinates) # regex checking valid input
                    x = get_x(coordinates)
                    y = get_y(coordinates)
                    @board.place_token(x, y, @player)
                    switch_players
                    break
                end
            end
        end

    end
end


game = Game.new
game.start_game





