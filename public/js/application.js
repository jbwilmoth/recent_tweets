$(document).ready(function() {
  $('#enter_username').on('submit', function(event) {
    event.preventDefault();
    $('#results').html('<img src="/wheelthrobber.gif"/><span>One Moment Please...</span>');
    var username = $("input[name='handle']").val();
    $.post(('/' + username), function(serverResponse) {
      $('#results').html(serverResponse);
    })
  })
});
