# create a secret code
# the secret code is gonna be a an array (list) of four colors(strings)
# the guess is gonna be four colors (blue yellow red green) 
# which is gonna be split into an array of four
# colors in the code can repeat but no blanks

# k cemu potrebuju board?
# game progress

class Peg
  attr_accessor :color
  @@colors = ["blue", "yellow", "red", "green", "purple", "pink"] 
  def initialize(color)
    @color = @@colors[color]
  end

  def compare(color)
    if @color == color # tohle by mozna slo zapsat jen jako @color == color
      return true
    else
      return false
    end
  end

  def self.colors
    @@colors
  end
end

class Board

end

class CodeBreaker
  attr_accessor :guess
  # user input (guess)
  # input validation
  # submit guess to CodeMaker
  def initialize
    @guess = ""
  end

  def guess_input
    while true
      puts("What's your guess?")
      @guess = gets
      @guess = @guess.downcase
      @guess = @guess.split(" ")

      @wrong_input_flag = false
      if @guess.length != 4
        puts("Wrong input. Enter four colors.\n")
        next
      else
        @guess.each do |element|
          unless Peg.colors.include?(element)
            #puts("Wrong input. Enter four colors.\n")
            #next
            @wrong_input_flag = true
          end
        end
        if @wrong_input_flag
          puts("Wrong input. Enter four colors.\n")
          next
        else
          break
        end
      end
    end  
  end
end

class CodeMaker
  attr_accessor :secret_code
  # create secret code
  # compare a guess to the secret code
  # provide feedback black/white pegs
  
  def generate_secret_code
    @secret_code = []
    4.times { @secret_code.push(Peg.new(rand(6))) }
  end

  def initialize
    self.generate_secret_code
  end

end

class Game
  #game loop
  # keeps track of attempts
  # check win/loss conditions
  # handles user input/output
  # codemaker si vymysli kod
  # codebreaker zada svuj guess
  # codemaker porovna se svym kodem a vrati bila/cerna kolecka viz pravidla
  # zvysi se counter pokusu
  # vyhodnoti se vyhra
  # pokud codebreaker nevyhral, smycka opet na zacatek
  def initialize
    @codemaker = CodeMaker.new
    @codebreaker = CodeBreaker.new
    puts(
    "---RULES---\n
    Codemaker creates a secret code of four colors (out of six possible).\n
    Colors can repeat.\n
    Codebreaker tries to guess the colors in 12 turns\n
    Guess is submitted in this form: color color color color .\n
    Feedback is black and white circles. White means right color, wrong position.\n
    Black means right color and position. Nothing means wrong color.\n
    The order of feedback doesn not correspond to the guessed positions.\n")

    counter = 0
    while counter < 12 do
      @codebreaker.guess_input
      puts(@codebreaker.guess)
    end
  end
end

game = Game.new