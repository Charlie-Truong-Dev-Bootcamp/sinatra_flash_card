$("#next").hide();
$("#score").hide();
$(document).ready(function() {

  var cards = JSON.parse($("#cards").html());
  setProgress(cards,-1);
  var count = 0;

  var score = [];

  $("#question").html(cards[count].question);
  

  $("#guess").click(function(){
    setProgress(cards,count);
    $(this).hide();
    $(this).removeClass("active_flashcard");
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
    if (count < (cards.length-1)){  
      $("#next").show();
      $("#next").addClass("active_flashcard"); 
    }
    else{
      $("#submit_score").show();
      $("#submit_score").addClass("active_flashcard");
    }
  });

  $("#next").click(function(){
    count += 1;
    $(this).hide();
    $(this).removeClass("active_flashcard");
    $("#answer").prop("disabled",false);
    $("#guess").show();
    $("#guess").addClass("active_flashcard");
    $("#feedback").html(" ");
    $("#question").html(cards[count].question);
    $("#answer").val("");
  });

  $("#submit_score").click(function(){
    $(window).unbind('beforeunload');
    $.post("/guess",{data: JSON.stringify(score)},redirect);
  });

  $(document).keypress(function(e) {
    if (e.which == 13) {
      $(".active_flashcard")[0].click()
      e.preventDefault();
    }
  });

  $(window).bind('beforeunload', function(){
    return 'Are you seriously thinking about quitting on me? \n All of your progress will be lost!';
  });

});

var redirect = function(response){
  window.location.href = response.redirect;
};

var setProgress = function(cards, count){
  var total = cards.length;
  var current_card = count + 1;
  var progress = current_card/total;
  var progressBarWidth = progress * $("#bar").width();  
  $("#progress").width(progressBarWidth);
  $("#progress-percentage").html((progress * 100)+ "% ");
};
