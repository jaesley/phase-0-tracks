// function findLongestWord(array)
//   create a blank longestWord variable
//   for every item in array, starting at index 0:
//     if longestWord is blank:
//       set longestWord to array[0]
//     else if current word is longer than longestWord
//       set longestWord to current word
//     end if
//     return longestWord
// end function

function findLongestPhrase(array) {
  longestWord = "";
  for ( i = 0; i < array.length; i++ ) {
    if ( array[i].length > longestWord.length ) {
      longestWord = array[i];
    }
  }
  return longestWord;
}

array_test = ["long phrase", "longest phrase", "longer phrase"];
console.log(findLongestPhrase(array_test));

array_pets = ["Blair", "Lylle", "Hallow", "Ewok", "Blunder", "Panda", "Puck"];
console.log(findLongestPrase(array_pets));

