$(document).ready(function(){

  fightButtonListener();

})
var score;
var clicks = 0;
var fightButtonListener = function() {
  $("#fight").one("click", function(){
      var hideBoo = function() {
        $("#smash").hide();
        console.log("Smash hide function  " + clicks)
        score = clicks;
        $.ajax({
          method: "put",
          url: "/battles"
        })
        //send dis to the controller
      }

      setTimeout(hideBoo, 2000)
      $("#fight").replaceWith("<button id='smash' class='btn'>Hello</p>")

      $("#smash").on("click", function(){
          console.log("hey");
          clicks += 1;
          console.log("Smash on click function  " + clicks)
          return clicks;
      });
      console.log("final end of function score  " + clicks)
  });
}


// click fight fight button,
// remove the fight button
// start a loop that counts up once per second
// once it reaches 10
