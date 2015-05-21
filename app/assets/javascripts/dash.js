$(document).ready(function() {
  'use strict';
  $('.flash_notice').on('click', '.dismiss-notice', function(event) {
    $(event.target.parentElement.parentElement.parentElement).remove();
  });
});
