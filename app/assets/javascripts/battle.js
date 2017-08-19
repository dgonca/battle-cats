$(document).ready(function(){

  fightButtonListener();

})
var score;
var clicks = 0;
var fightButtonListener = function() {
  $("#fight").one("click", function(){
      var ajaxFunction = function(score) {
        $.ajax({
          type: "put",
          url: '/'
          // data: score
        });
      }

      var hideBoo = function() {
        $("#smash").hide();
        console.log("Smash hide function  " + clicks);
        score = clicks;
        ajaxFunction(score);
        //send dis to the controller
      }

      setTimeout(hideBoo, 2000)
      $("#fight").replaceWith("<button id='smash' class='btn'>Hello</p>")

      $("#smash").on("click", function(){
          clicks += 1;
          return clicks;
      });
      console.log("final end of function score  " + clicks)
  });
}


// click fight fight button,
// remove the fight button
// start a loop that counts up once per second
// once it reaches 10
