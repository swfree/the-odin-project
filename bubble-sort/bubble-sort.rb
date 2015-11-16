#Basic Bubble Sort Algorithm
#Improvements to Add: 
###stop the program as soon as array is sorted
###don't check last element after first iteration, or second to last after second iteration, etc.

def bubble_sort(array)
  1.upto(array.length - 1) do 
    array.each_with_index do |element, index|
      if index+1 >= array.length
        break
      elsif element > array[index+1]
        array[index] = array[index+1]
        array[index+1] = element
      else
        next
      end
    end
  end
  p array
end

bubble_sort([1,5,2])
bubble_sort([1,5,3,2])
bubble_sort([7,6,5,4,3,2,1])