def substrings(text,dictionary)
  words = text.downcase.split(" ")
  frequencies = Hash.new(0)
  words.each do |word|
    dictionary.each do |dict_word|
      frequencies[dict_word] += 1 if word.include?(dict_word)
    end
  end
  frequencies
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below",dictionary)
p substrings("howdy partner how going how",dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)