$(document).ready(function() {

  $('#button').click(function(e) {
    e.preventDefault();
    var route = $('form').attr('action');
    var user_input = $("#guess").val();
    // console.log(user_input);
    $.post(route, $("#user_input").serialize(), function(response_data) {
      console.log("Data loaded: " + response_data.feedback );
      $("#top p").html(response_data.feedback);
      if(response_data.hasOwnProperty('redirect')) {
        $("#message").text("You're finished!");
        $("#message").css("text-align","center");
        $("#message").css("font-size","xx-large");
        $("#user_input").hide();
        $("#question").hide();
        $("#meter progress").hide();
        setTimeout(function() {
        window.location.href = "/stats";}, 3000);
      } else {
        $("#meter progress").attr("value", response_data.num + "0");
        $("#guess").val("");
        $("#question").html(response_data.card);
      }
    });
    console.log("outside of the post!");
  });
});


