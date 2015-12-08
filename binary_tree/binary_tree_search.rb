class Node
  attr_reader :value
  attr_accessor :left, :right, :parent

  def initialize(value)
    @value = value
  end
end

def build_tree(array, arr_start, arr_end)
  # Base case
  return if arr_start > arr_end

  mid = (arr_start + arr_end)/2
  root = Node.new(array[mid])

  # Recursion cases
  root.left = build_tree(array, arr_start, mid-1)
  root.right = build_tree(array, mid+1, arr_end)

  root
end

def doBFS(array, tree, target)
  visited = []
  queue = []
  bfsInfo = {}

  queue << tree
  visited << tree
  bfsInfo[tree.value] = { distance: 0, predecessor: nil }

  while queue.any?
    vertex = queue.shift
    l = vertex.left
    r = vertex.right

    unless visited.include?(l) || l == nil
      queue << l
      visited << l
      dist = bfsInfo[vertex.value][:distance]+1
      pred = vertex.value
      bfsInfo[l.value] = { distance: dist, predecessor: pred }
    end

    unless visited.include?(r) || r == nil
      queue << r
      visited << r
      dist = bfsInfo[vertex.value][:distance]+1
      pred = vertex.value
      bfsInfo[r.value] = { distance: dist, predecessor: pred }    
    end
  end

  if bfsInfo.include?(target)
    return "Your target #{target} has predecessor #{bfsInfo[target][:predecessor]} and distance #{bfsInfo[target][:distance]}. #{bfsInfo}"
  else
    return "Could not find your target"
  end
end

arr = [0,1,2,4,8,13,21,26,52]

tree = build_tree(arr, 0, arr.length-1)
puts tree.inspect

puts doBFS(arr, tree, 4)