# [17, 3, 6, 9, 15, 8, 6, 1, 10]
# vezmu 1. cislo a pomoci dvou vnorenych cyklu budu porovnavat
# hledam nejvetsi rozdil

def stock_picker(array)
  diff = -1
  result = [-1, -1]
  array.each_with_index do |_price, index|
    for i in index..(array.length - index - 1) # tady je problem, davam mu jedno cislo, ne rozsah
      next unless (array[i] - array[index]) > diff

      diff = array[i] - array[index]
      result[0] = index
      result[1] = i
    end
  end
  result
end
prices = [8, 7, 6, 5, 4, 3, 2, 1]

puts stock_picker(prices)

# for i in 0..(9 - 0 - 1)
#   if(17 - 0) > -1
#
