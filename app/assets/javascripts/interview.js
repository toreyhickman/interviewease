$(document).ready(function() {

  $('#interview_sidebar').on('click', 'span.clickable', function() {
    var challengeId = $(this).data().challengeid;
    var candidateId = $('#interview_show_wrapper').data().candidateid;
    var interviewId = $('#interview_show_wrapper').data().interviewid;

    var dataToSend = {challenge_id: challengeId, candidate_id: candidateId, interview_id: interviewId }

    $.ajax({
      url: "/given_challenges",
      type: "POST",
      data: dataToSend,
      dataType: "JSON",
    }).done(function(data){

      $('h1').html(data.challenge.title);
      $('#interview_challenge_description').html(data.challenge.description);
      $('#interview_test_code').html(data.challenge.test_code);
      $('.CodeMirror-code div pre span').html(data.challenge.code);

    });
  });
});
