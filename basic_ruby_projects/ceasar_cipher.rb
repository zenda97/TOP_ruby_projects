def ceasar_cipher(string, shift)
  ciphered_text = ''
  ascii_value = 0
  string.each_char do |char|
    ascii_value = 0
    if char.match?(/[a-z]/)
      ascii_value = char.ord + shift
      ascii_value -= 26 if ascii_value > 122
      ciphered_text << ascii_value.chr
    elsif char.match?(/[A-Z]/)
      ascii_value = char.ord + shift
      ascii_value -= 26 if ascii_value > 90
      ciphered_text << ascii_value.chr
    else
      ciphered_text << char
    end
  end
  ciphered_text
end

msg = 'Hello, World!'

puts ceasar_cipher(msg, 5)
