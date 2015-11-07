def stock_picker(array)
  paired_array = array.combination(2).to_a
  sorted_array = paired_array.sort{|x,y| (y.last - y.first) <=> (x.last - x.first)}
  winning_pair = sorted_array.first
  winning_index = []
  winning_pair.each {|x| winning_index << array.index(x)}
  winning_index
end

#Tests if stock_picker method works as it should
p stock_picker([17,3,6,9,15,8,6,1,10])
#should equal: [1,4]