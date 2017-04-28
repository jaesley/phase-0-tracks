# Search for the index of an array item... without using .index

def search_array(array, x)
  i = 0
  
  if !array.include? x
    return NIL
  else
    while i < array.length
      until array[i] == x
        i += 1
      end
      return i
    end
  end
end

array1 = [1, 2, 3, 4, 5]
search_array(array1, 1)

# Return an array of Fibonacci numbers

def fib(x)
  sequence = [0, 1]
  
  (x-2).times do |y| 
    y = sequence[-1] + sequence[-2]
    sequence << y
  end
  
  return sequence
end

fib(3)

# Sort an array via bubble sort

# method bubblesort(array)
#   for array length - 1 times
#     x = 0
#     compare index x and index x + 1
#       if index x > index x + 1
#         swap index x and index x + 1
#       end if
#     increment x by 1
#   end loop
# end method

def bubblesort(array)
  loop do
    sorted = false
  
    (array.length - 1).times do |x|
      if array[x] > array[x + 1]
        array[x], array[x + 1] = array[x + 1], array[x]
        sorted = true
      end
    end
    
    break if not sorted
  end
  
  return array
end

array1 = [5,3,56,2,4,32]
bubblesort(array1)