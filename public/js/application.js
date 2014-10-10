jQuery(document).ready(function($) {
  function updateCountdown() {
      // 140 is the max message length
      var remaining = 140 - jQuery('.message').val().length;
      jQuery('.countdown').text(remaining + ' characters remaining.');
  }

  updateCountdown();
  $('.message').change(updateCountdown);
  $('.message').keyup(updateCountdown);
});