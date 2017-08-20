$(document).ready(function(){
  fightButtonListener();
})

var score;
var clicks = 0;
var fightButtonListener = function() {
  $("#fight").one("click", function(){
      var $div = $(this).closest("div").attr("class")

      var hideBoo = function() {
        $("#smash").hide();
        score = clicks;

        $.ajax({
          method: "put",
          url: "/battles/" + $div,
          data: {score: score}
        });
      }
      setTimeout(hideBoo, 2000);
      $("#fight").replaceWith("<button id='smash' class='btn'>Hello</button>")

      $("#smash").on("click", function(){
          clicks += 1;
          return clicks;
      });
  });
}

// click fight fight button,
// remove the fight button
// start a loop that counts up once per second
// once it reaches 10
