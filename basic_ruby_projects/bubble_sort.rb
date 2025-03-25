def bubble_sort(numbers)
  while true
    n = numbers.length
    swapped = false
    for i in 1..n - 1
      next unless numbers[i] > numbers[i - 1]

      tmp = numbers[i]
      numbers[i] = numbers[i - 1]
      numbers[i - 1] = tmp
      swapped = true
    end
    return numbers if swapped == false
  end
end

numbers = [17, 3, 6, 9, 15, 8, 6, 1, 10]
puts bubble_sort(numbers)
