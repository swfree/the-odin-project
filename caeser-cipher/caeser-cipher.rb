def caeser_cipher(sentence,num)
  #Splits user input into an array, including spaces
  letters = sentence.split(//)

  alphabet1 = ('a'..'z').to_a
  alphabet2 = ('A'..'Z').to_a

  letters.each_with_index.map do |element,index|

    #Sets letter case
    element == element.upcase ? alphabets = alphabet2 : alphabets = alphabet1

    #Skips spaces and punctuation
    #Wraps from z to a
    if alphabets.include?(element) == false
      next 
    elsif alphabets.index(element) + num > 25
      new_index_in_alphabets = (alphabets.index(element) + num) - 26
      letters[index] = alphabets[new_index_in_alphabets]
    else
      new_index_in_alphabets = alphabets.index(element) + num 
      letters[index] = alphabets[new_index_in_alphabets]
    end

  end

  letters.join

end

#Tests if Caeser Cipher works as it should:
puts caeser_cipher("The quick brown fox jumps over the lazy dog!",5)



#ALTERNATIVE:: ('a'..'z').each {|letter| puts letter.ord} >> to get ASCII character value 