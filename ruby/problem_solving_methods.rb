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