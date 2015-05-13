class StripeController < ApplicationController
  def connect
  end

  def connected
  	# This is the endpoint for users coming back to the site via the oAuth flow
  	if ! params[:access_denied]
  		code = params[:code]
  		# stripe_user = StripeUser.new;
  		# stripe_user.access_token = params[:access_token]
  		# stripe_user.livemode = params[:livemode]
  		# stripe_user.refresh_token = params[:refresh_token]
  		# stripe_user.user_id = current_user.id
  		# stripe_user.stripe_user_id = params[:stripe_user_id]
  		# stripe_user.stripe_publishable_key = params[:stripe_publishable_key]
  		# stripe_user.save
  	else
  		@error_type = params[:error]
  		@error_message = params[:error_description]
  	end
  end
end
