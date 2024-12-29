def ceasar_cipher(string, shift)
  ciphered_text = ""
  ascii_value = 0
  string.each_char do |char|
    ascii_value = 0
    if char.match?(/[a-z]/)
      ascii_value = char.ord + shift
      if ascii_value > 122
        ascii_value = ascii_value - 26
      end
      ciphered_text << ascii_value.chr
    elsif char.match?(/[A-Z]/)
      ascii_value = char.ord + shift
      if ascii_value > 90
        ascii_value = ascii_value - 26
      end
      ciphered_text << ascii_value.chr
    else
      ciphered_text << char
    end
  end
  return ciphered_text
end

msg = "Hello, World!"

puts ceasar_cipher(msg, 5)
