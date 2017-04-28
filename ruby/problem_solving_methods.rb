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