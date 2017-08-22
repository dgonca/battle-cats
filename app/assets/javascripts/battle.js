$(document).ready(function(){
  $("#redirect-to-profile").hide();
  fightButtonListener();
  movePetPicture();
  hideExplosion();
});
var hideExplosion = function() {
  $('#explosion').hide();
}
var explosion = function() {
  $('#explosion').show();
  $('#explosion').sprite({fps: 12, no_of_frames: 3});
}
var movePetPicture = function() {
  $(".pet-show-card").on("click","#smash-button", function(){
    $("#right-pet").animate({left: "10px"}, 40);
    $("#right-pet").animate({left: "-10px"}, 40);
    $("#right-pet").animate({left: "0px"}, 40);
    $("#left-pet").animate({right: "10px"}, 40);
    $("#left-pet").animate({right: "-10px"}, 40);
    $("#left-pet").animate({right: "0px"}, 40);
  })
}
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
     hideExplosion();
     $("#redirect-to-profile").show();
     sendPromise(clicks);


   };

   setTimeout(hideSmashButton, 2000);
   replaceFightButton();
   explosion();
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
