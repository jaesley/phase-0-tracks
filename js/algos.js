// Find Longest Phrase

// function findLongestWord(array)
//   create a blank longestWord variable
//   for every item in array, starting at index 0:
//     if longestWord is blank:
//       set longestWord to array[0]
//     else if current word is longer than longestWord
//       set longestWord to current word
//     end if
//   end loop
//   return longestWord
// end function

function findLongestPhrase(array) {
  var longestWord = "";
  for ( i = 0; i < array.length; i++ ) {
    if ( array[i].length > longestWord.length ) {
      longestWord = array[i];
    }
  }
  return longestWord;
}

var array_test = ["long phrase", "longest phrase", "longer phrase"];
console.log(findLongestPhrase(array_test));

var array_pets = ["Blair", "Lylle", "Hallow", "Ewok", "Blunder", "Panda", "Puck"];
console.log(findLongestPhrase(array_pets));

// Data Entry

function Person(name, age) {
  this.name = name;
  this.age = age;
}

var steven = new Person("Steven", 54);
var tamir = new Person("Tamir", 54);

function Creature(animal, legs) {
  this.animal = animal;
  this.legs = legs;
}

var dog4 = new Creature("Dog", 4);
var dog3 = new Creature("Dog", 3);

// Find Matching Key/Value Pair

// function pairMatch(object1, object2)
//   for each key in object1, starting at 0
//     if key matches corresponding key in object2
//       return true
//   end loop
// end function(

function pairMatch(object1, object2) {
  for ( var k in object1 ) {
    if ( object1[k] === object2[k] ) {
      return true;
    }
  }
  return false
}

console.log(pairMatch(steven, tamir));
console.log(pairMatch(dog4, dog3))