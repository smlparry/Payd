$(document).on('ready page:change', function() {
  'use strict';
  // Make the plan input only money
  $('#plan_amount').maskMoney();

  // Html for toggle inputs
  var trialButton = '<button id="trial_period_button" class="button-hollow trial margin-right">Add a Trial Period</button>';
  var trialDays = '<input placeholder="Days of trial" type="number" name="plan[trial_period_days]" id="plan_trial_period_days"><i id="remove_trial" class="ion-ios-close-outline"></i>';

  // div to append to
  var trialDiv = $('#trial_box').children(':first');
  $('#trial_box').on('click', '#trial_period_button', function(event) {
    event.preventDefault();
    // Make sure it does not already exist
    if ( $('#plan_trial_period_days').length === 0 ) {
      trialDiv.empty();
      trialDiv.append(trialDays);
    }
  });
  $('#trial_box').on('click', '#remove_trial', function(event) {
    event.preventDefault();
    if ( $('#trial_period').length === 0 ) {
      trialDiv.empty();
      trialDiv.append(trialButton);
    }
  });
});
