# Check if a string contains any substrings from a dictionary
# and if so, count how many times
# returns a hash

def substrings(string, dictionary)
  match_count = {}
  string = string.split(' ')
  string.each do |word|
    dictionary.each do |element|
      next unless word.downcase.include?(element)

      match_count[element] = if match_count.key?(element)
                               match_count[element] + 1
                             else
                               1
                             end
    end
  end
  match_count
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

howdy = "Howdy partner, sit down! How's it going?"
puts substrings(howdy, dictionary)
