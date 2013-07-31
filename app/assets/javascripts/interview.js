$(document).ready(function() {

  $('#interview_sidebar').on('click', 'span.clickable', function() {
    alert($(this).data().challengeId);

    $.post("/given_challenges")
  });
});
