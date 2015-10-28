#Create Book class with Book#title method that capitalizes a phrase according to book title conventions

class Book
	attr_accessor :title
	def title
		capitalized = @title.split.map { |x| x.capitalize }
		little_words = ["And","The","Over","A","An","In","Of"]
		final_array = [capitalized.first] + capitalized.drop(1).map { |x| little_words.include?(x) ? x.downcase : x}
		final_array.join(" ")
	end
end