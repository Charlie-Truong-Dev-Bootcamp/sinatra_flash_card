$("#next").hide();
$("#score").hide();
$(document).ready(function() {

  var cards = getCards();
  var count = 0;
  var score = [];

  $("#question").html(cards[count].question);
  

  $("#guess").click(function(){
    $(this).hide();
    $(this).removeClass("active");
    $("#answer").prop("disabled",true);
    if(cards[count].answer.toLowerCase() === $("#answer").val().toLowerCase()){
      $("#feedback").html("Correct!");
      score.push({card_id: cards[count].card_id, correctness: 1});
    }
    else if($("#answer").val() === ""){
      $("#feedback").html("You should have at least taken a guess!");
      score.push({card_id: cards[count].card_id, correctness: 0});
    }
    else{
      $("#feedback").html("Incorrect!  The answer was " + cards[count].answer);
      score.push({card_id: cards[count].card_id, correctness: -1});
    }
    if (count <9){  
      $("#next").show();
      $("#next").addClass("active"); 
    }
    else{
      $("#score").show();
      $("#score").addClass("active");
    }
  });

  $("#next").click(function(){
    count += 1;
    $(this).hide();
    $(this).removeClass("active");
    $("#answer").prop("disabled",false);
    $("#guess").show();
    $("#guess").addClass("active");
    $("#feedback").html("");
    $("#question").html(cards[count].question);
    $("#answer").val("");
  });

  $("#score").click(function(){
    $.post("/guess",{data: JSON.stringify(score)},redirect);
    console.log(score);
  });

  $(document).keypress(function(e) {
    if (e.which == 13) {
      $(".active")[0].click()
      e.preventDefault();
    }
  });

});

var getCards = function(){
    var cards = null;
    $.ajax({
        type: "GET",
        url: "/randomcards",
        async:false,
        data: {location: window.location.pathname},
        success: function(response){
          cards = response;
        }
    });
    return cards;
};

var redirect = function(response){
  window.location.href = response.redirect;
};
