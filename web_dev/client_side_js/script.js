// Test link
console.log("script works")

//Release 1 modify DOM
var para = document.getElementsByTagName("p");

para[0].style.backgroundColor = "blue";

//Release 2 add event listener
var catGif = document.getElementById("cat-gif");

catGif.style.visibility = "hidden";

function revealCatGif(event) {
  console.log("function ran")
  catGif.style.visibility = "visible";
}

var beachPhoto = document.getElementById("beach-photo");

beachPhoto.addEventListener("click",revealCatGif);