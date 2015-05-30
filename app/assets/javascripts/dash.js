$(document).on('ready page:change', function() {
  'use strict';
  $('.flash').on('click', '.dismiss-flash', function(event) {
    $(event.target.parentElement.parentElement.parentElement).remove();
  });

  $('.datatable').DataTable({
    retrieve: true,
    language: {
        search: '_INPUT_',
        searchPlaceholder: 'Search Table'
    },
    'order': [[ 0, 'desc' ]]
  });

  $('form').on('submit', function() {
    $('#modal-overlay').removeClass('hide');
  });
});
