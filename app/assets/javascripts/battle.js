$(document).ready(function(){
  fightButtonListener();
})

var score;
var clicks = 0;
var fightButtonListener = function() {
  $("#fight-button").one("click", function(){
      var $divNum = $(this).closest("div").attr("class")

      var hideSmashButton = function() {
        $("#smash").hide();
        score = clicks;

        $.ajax({
          method: "put",
          url: "/battles/" + $divNum,
          data: {score: score}
        });
      }

      setTimeout(hideSmashButton, 2000);

      
      $("#fight-button").replaceWith("<button id='smash' class='btn'>Hello</button>")

      $("#smash").on("click", function(){
          clicks += 1;
          return clicks;
      });
  });
}