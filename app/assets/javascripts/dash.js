$(document).ready(function() {
  'use strict';
  $('.flash').on('click', '.dismiss-flash', function(event) {
    $(event.target.parentElement.parentElement.parentElement).remove();
  });
});
