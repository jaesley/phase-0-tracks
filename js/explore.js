// function reverseString(string)
//   create an empty string variable
//   for times equal to string length:
//     move each letter of input into empty string,
//     starting with the final letter and moving backward
// end function

var str = "Hello World!"

function reverseString(string) {
  strReverse = ""

  for ( i = string.length; i > -1; i-- ) {
    strReverse += string.charAt(i)
  }

  return strReverse
}

var reversedString = reverseString(str)

if ( 1 == 1 ) {
  console.log(reversedString)
}