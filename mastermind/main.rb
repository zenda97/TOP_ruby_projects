# create a secret code
# the secret code is gonna be a an array (list) of four colors(strings)
# the guess is gonna be four colors (blue yellow red green) 
# which is gonna be split into an array of four
# colors in the code can repeat but no blanks

# k cemu potrebuju board?
# game progress

class Peg
  attr_accessor :color
  def initialize(color)
    @color = color
  end

  def compare(color)
    if @color == color # tohle by mozna slo zapsat jen jako @color == color
      return true
    else
      return false
    end
end

class Board

end

class CodeBreaker
  # user input (guess)
  # input validation
  # submit guess to CodeMaker

end

class CodeMaker
  colors = ["blue", "yellow", "red", "green", "purple", "pink"]

  def create_secret_code
    @secret_code = []
    4.times { @secret_code.push(colors[rand(6)])}
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

end