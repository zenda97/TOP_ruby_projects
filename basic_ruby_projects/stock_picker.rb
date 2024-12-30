# [17, 3, 6, 9, 15, 8, 6, 1, 10]
# vezmu 1. cislo a pomoci dvou vnorenych cyklu budu porovnavat
# hledam nejvetsi rozdil


def stock_picker(array)
  diff = -1
  result = [-1, -1]
  array.each_with_index do |price, index|
    i = index
    for i in index..(array.length - index - 1) #tady je problem, davam mu jedno cislo, ne rozsah
      if (array[i] - array[index]) > diff
        diff = array[i] - array[index]
        result[0] = index
        result[1] = i
      end
    end
  end
  return result
end

array = [17,3,6,9,2,8,6,11,10,1]
prices = [8,7,6,5,4,3,2,1]

puts stock_picker(prices)


# for i in 0..(9 - 0 - 1)
#   if(17 - 0) > -1
#
