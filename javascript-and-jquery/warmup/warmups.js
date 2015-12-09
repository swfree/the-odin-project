//Build a function my_max(array) #=> max
function myMax(a) {
  max = 0;
  a.forEach(findMax);
  return max;
}

function findMax(element, index, array) {
  if(element > max) {
    max = element;
  }
}

var array = [1,2,3,7,5,4]; 
console.log(myMax(array));

//Build a function vowel_count(string) #=> number of vowels(AEIOUY)
function vowelCount(str) {
  chars = str.split("");
  vowels = "aeiouy";
  numVowels = 0;
  
  chars.forEach(function(letter) {
    if (~vowels.indexOf(letter)) {
      numVowels++;
    }
  })
  
  return numVowels;
}

var string = "hello there";
console.log(vowelCount(string));


//Build a function reverse(string) #=> returns all characters in opposite position
function reverse(string) {
  var chars = string.split('');
  var len = string.length;
  var reverseChars = [];
  
  for (var i = 0; i < len; i++) {
    reverseChars.push(chars.pop());
  }
  
  reversed = reverseChars.join('');
  return reversed;
}

var str = "hello";
console.log(reverse(str));