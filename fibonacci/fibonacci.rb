def fib_num_at(x)
  # Base case
  return 0 if x == 0
  return 1 if x == 1

  # Recursive case
  return fib_num_at(x - 1) + fib_num_at(x - 2)
end

def fib(n)
  result = []
  n.times do |i|
    result << fib_num_at(i)
  end
  result.join(", ")
end

puts fib(10)