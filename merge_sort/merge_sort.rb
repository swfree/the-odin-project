def merge_sort(list)
  # Base case
  if list.length <= 1
    return list
  end

  # Recursive case
  a = []
  b = []
  list.each_with_index do |e, i|
    if i.odd?
      a << e
    else
      b << e
    end
  end

  # Recursively sort both sublists
  a = merge_sort(a)
  b = merge_sort(b)

  # Merge the now-sorted lists.
  return merge_lists(a, b)
end

def merge_lists(a, b)
  result = []

  while !a.empty? && !b.empty?
    if a.first <= b.first
      result << a.first
      a.shift
    else
      result << b.first
      b.shift
    end
  end

  while !a.empty?
    result << a.first
    a.shift
  end
  while !b.empty?
    result << b.first
    b.shift
  end

  return result
end

c = [108, 23, 16, 8, 4, 15, 50, 42]

puts "Sort this list >> [108, 23, 16, 8, 4, 15, 50, 42]"
puts "Sorted         >> #{merge_sort(c)}"