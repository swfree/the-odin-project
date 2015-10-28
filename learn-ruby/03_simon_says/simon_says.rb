#"Simon Says" methods

def echo(str)
	str
end

def shout(str)
	str.upcase
end

def repeat(str, n = 2) #Returns string of n-times repeated input, with spaces
	n.times.map { str }.join(" ")
end

def start_of_word(str,n=1) #Returns first letter(s) of a word
  str.split("").take(n).join("")
end

def first_word(str)
  str.split.first
end

def titleize(str) #Capitalizes all words except small words, unless small words start the sentence
	capitalized = str.split.map { |x| x.capitalize }
	little_words = ["And","The","Over"]
	final_array = [capitalized.first] + capitalized.drop(1).map { |x| little_words.include?(x) ? x.downcase : x}
	final_array.join(" ")
end