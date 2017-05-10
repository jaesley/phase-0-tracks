var horses = {}
var names = ["Ed", "Jae", "Rick", "Four"]
var colors = ["blue", "red", "green", "yellow"]

for ( i = 0; i < colors.length; i++ ) {
  horses[names[i]] = colors[i]
}

console.log(horses)

function Car(color, year, automaticTrans) {
  this.color = color;
  this.year = year;
  this.automaticTrans = automaticTrans;

  this.startEngine = function startEngine() {
    console.log("*cranks car*")    
  };
}

var carJae = new Car("black", 2006, true);
console.log(carJae);
carJae.startEngine();

var carMelissa = new Car("red", 2008, false);
console.log(carMelissa);
carMelissa.startEngine();

var carNate = new Car("gold", 2015, true);
console.log(carNate);
carNate.startEngine();