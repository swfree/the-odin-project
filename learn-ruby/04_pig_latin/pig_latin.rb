#Translates a string into Pig Latin

def translate(str)
  #Split user input into individual words
  words = str.downcase.split(" ")
  letters = words.map { |e| e.split("") }
  vowels = ["a","e","i","o","u"]

  letters.map! do |element|
  	#For words starting with vowels
  	if vowels.include? element.first
  		element << "ay"
  		element.join("")
    #For special case "qu"
  	elsif element.include? "q"
  		until element.first == "u" do
  			element << element.shift
  		end
  		element << element.shift
  		element << "ay"
  		element.join("")
  	#For words starting with consonants
  	else
  		until vowels.include? element.first do
  			element << element.shift
  		end
  		element << "ay"
  		element.join("")
  	end
  end
  letters.join(" ")
end