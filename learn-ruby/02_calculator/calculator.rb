#Calculator adds, subtracts, sums an array, multiplies, raises to a power, and finds factorial

def add(x,y)
	x+y
end

def subtract(x,y)
	x-y
end

def sum(array)
	total = 0
	if !array.empty?
  	array.each {|x| total += x} 
  end
	return total
end

def multiply(*numbers)
	numbers.inject(1) {|product,number|product*number}
end

def power(a,b)
	a**b
end	

def factorial(n)
	(1..n).inject(1) {|product,number|product*number}
end