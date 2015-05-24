# Stripe Connect user account details
class StripeUser < ActiveRecord::Base
  # relations
  belongs_to :user

  # Makes a new stripe user with oAuth response
  def make_from_request(response, user_id)
    self.user_id = user_id
    self.stripe_publishable_key = response['stripe_publishable_key']
    self.stripe_user_id = response['stripe_user_id']
    self.livemode = response['livemode']
    self.refresh_token = response['refresh_token']
    self.access_token = response['access_token']
    save
  end
end
