$(document).ready(function() {
  $(".answer-form").on("submit", function(e) {
    console.log("fired");
    event.preventDefault();
    var $answer = $(this);
    console.log($answer.attr("action"))
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
});
