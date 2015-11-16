class Array
  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    counter = 0
    for i in self
      yield(i, counter)
      counter += 1
    end
  end

  def my_select
    new_array = []
    for i in self
      if yield(i)
        new_array << i
      end
    end
    new_array
  end

  def my_all?
    all_true = true
    for i in self
      all_true = false if !yield(i)
    end
    all_true
  end

  def my_any?
    any_true = false
    for i in self
      any_true = true if yield(i)
    end
    any_true
  end

  def my_none?
    all_false = true
    for i in self
      all_false = false if yield(i)
    end
    all_false
  end

  def my_count
    new_array = []
    for i in self
      if yield(i)
        new_array << i
      end
    end
    new_array.length
  end

  def my_map
    new_array = []
    for i in self
      new_array << yield(i)
    end
    new_array
  end

  def my_map_with_proc(proc)
    new_array = []
    for i in self
      new_array << proc.call(i)
    end
    new_array
  end

  def my_inject(sum=0)
    for i in self
      sum = yield(sum, i)
    end
    sum
  end
end

# Test calling the new methods
array = [5,10]
a_proc = Proc.new{|x| x+2}
array.my_each { |x| print "#{x}! " }                    # => 5! 10!
array.my_each_with_index { |x,i| print "#{i}: #{x}! " } # => 0: 5! 1: 10!
array.my_select { |x| x % 2 == 0 }                      # => [10]
array.my_all? { |x| x % 2 == 0 }                        # => false
array.my_any? { |x| x % 2 == 0 }                        # => true
array.my_none? { |x| x % 2 == 0 }                       # => false
array.my_count { |x| x % 2 == 0 }                       # => 1
array.my_map { |x| x+2 }                                # => [7,12]
array.my_map_with_proc(a_proc)                          # => [7,12]
array.my_inject {|sum,n| sum+n}                         # => 15
array.my_inject(1) {|product,n| product*n}              # => 50