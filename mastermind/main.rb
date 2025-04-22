# create a secret code
# the secret code is gonna be a an array (list) of four colors(strings)
# the guess is gonna be four colors (blue yellow red green) 
# which is gonna be split into an array of four
# colors in the code can repeat but no blanks

class Peg
  attr_accessor :color
  @@colors = ["blue", "yellow", "red", "green", "purple", "pink"] 
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
    @result = []
    @guess.each do |element| 
      @result.push(Peg.new(element))
    end
    return @result 
  end
end

class CodeMaker
  attr_accessor :secret_code
  # create secret code
  # compare a guess to the secret code
  # provide feedback black/white pegs (X or O)
  @@colors = ["blue", "yellow", "red", "green", "purple", "pink"]
  
  def generate_secret_code
    @secret_code = Array.new()
    4.times { @secret_code.push(Peg.new(@@colors[rand(6)])) }
  end

  def initialize
    self.generate_secret_code
  end

  def secret_code
    @secret_code
  end

end

class Game
  @@rules_msg = "---RULES---\n
    Codemaker creates a secret code of four colors (out of six possible: blue, yellow, green, purple, pink, red).\n
    Colors can repeat.\n
    Codebreaker tries to guess the colors in 12 turns\n
    Guess is submitted in this form: color color color color .\n
    Feedback is black and white circles. O means right color, wrong position.\n
    X means right color and position. Nothing means wrong color.\n
    The order of feedback doesn not correspond to the guessed positions.\n"

  def guess_comparison(secret, guess)
    @result = Array.new()
    colors_secret = []
    colors_guess = []
    secret.each { |element| colors_secret.push(element.color)}
    guess.each { |element| colors_guess.push(element.color)}

    puts("Guess comparison method")
    puts("Secret code")
    puts(colors_secret.join(" "))
    puts("Guess")
    puts(colors_guess.join(" "))

    for element in colors_guess
      if colors_secret.include?(element)
        if colors_secret.index(element) == colors_guess.index(element)
          @result.push("X")
        else
          @result.push("O")
        end
      end
    end
    return @result
  end

  def initialize
    @codemaker = CodeMaker.new
    @codebreaker = CodeBreaker.new
    puts(@@rules_msg)
    @codemaker.secret_code.each { |element| puts("#{element.color}")  }  

    counter = 0
    while counter < 12 do
      @input = @codebreaker.guess_input
      res = guess_comparison(@codemaker.secret_code, @input)
      puts(res.shuffle!.join(""))
      counter += 1
    end
  end
end

game = Game.new
