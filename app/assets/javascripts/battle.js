$(document).ready(function(){
  $("#redirect-to-profile").hide()
  fightButtonListener();
})

var score;
var clicks = 0;
var fightButtonListener = function() {
 $("#fight-button").one("click", function(){
    var $divNum = $(this).closest("div").attr("class")

    var sendPromise = function(score) {
      $.ajax({
        method: "put",
        url: "/battles/" + $divNum,
        data: {score: clicks}
      });
    };

    var hideSmashButton = function() {
      $("#smash-button").hide();
      $("#redirect-to-profile").show()
      sendPromise(clicks);
    };

    setTimeout(hideSmashButton, 2000);
    replaceFightButton();
    clickAccumulator();

  });
}

var clickAccumulator = function() {
 $("#smash-button").on("click", function(){
     clicks += 1;
     return clicks;
 });
};

var replaceFightButton = function() {
$("#fight-button").replaceWith("<button id='smash-button' class='btn'>Click Me!</button>");
};
