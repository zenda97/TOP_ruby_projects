class Board
    attr_accessor :board
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
        if @board[x][y] == " "
            @board[x][y] = token
            return true
        else
            return false
        end
        
    end

    def check_rows(token)
        winner = false
        for i in [0, 2, 4] do 
            for j in [2, 4, 6] do
                if @board[i][j] == token
                    winner = true
                else
                    winner = false
                    break
                end
            end
            if winner
                return winner
            end
        end
        return winner
    end

    def check_columns(token)
        winner = false
        for i in [2, 4, 6] do
            for j in [0, 2, 4] do
                if @board[j][i] == token
                    winner = true
                else
                    winner = false
                    break
                end
            end
            if winner
                return winner
            end
        end
        return winner
    end

    def check_diagonals(token)
        winner = false
        for i in [0, 2, 4] do
            if @board[i][i+2] == token
                winner = true
            else
                winner = false
                break
            end
        end

        if winner
            return winner
        end

        for j in [0, 2, 4] do
            if @board[j][6-j] == token
                winner = true
            else
                winner = false
                break
            end
        end
        return winner
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

    def check_for_winner(token)
        if @board.check_rows(token)
            return token
        elsif @board.check_columns(token)
            return token
        elsif @board.check_diagonals(token)
            return token
        else
            return false
        end
    end

    def get_x(coordinates) # Map ABC to numbers
        case coordinates[0]
        when 'A', 'a'
            return 0
        when 'B', 'b'
            return 2
        when 'C', 'c'
            return 4
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
        counter = 0
        while true
            @board.print_board
            counter += 1
            if counter > 9
                puts("It's a tie!")
                return
            end
            puts("Player's #{@player} turn")
            while true
                puts("Enter coordinates (A1, B3...)")
                coordinates = gets
                if /^[ABCabc][123]$/.match(coordinates) # regex checking valid input
                    x = get_x(coordinates)
                    y = get_y(coordinates)
                    
                    if @board.place_token(x, y, @player) == false # If the spot is not empty, ask for input again
                        next
                    end
                    if check_for_winner(@player)
                        @board.print_board
                        puts("#{@player} wins!")
                        return
                    end
                    switch_players
                    break
                end
            end
        end
    end
end


game = Game.new
game.start_game





