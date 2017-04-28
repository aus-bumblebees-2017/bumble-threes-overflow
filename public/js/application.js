$(document).ready(function() {
  $(".answer-form").on("submit", function(e) {
    console.log("fired");
    event.preventDefault();
    var $answer = $(this);
    $.ajax({
      url: $answer.attr("action"),
      method: $answer.attr("method"),
      data: $answer.serialize()
    })
    .done(function(answer) {
      $(".answers").append(answer);
      $("textarea").val("");
    });
  });
  $(".container").on("click", ".vote", function(e) {
    console.log("vote");
    event.preventDefault();
    var $vote = $(this);

    $.ajax({
      url: $vote.attr("href"),
      method: "GET"
    })
    .done(function(resp) {
      $vote.siblings("span.vote_count").text(resp.vote_count)
    });
  });
})
