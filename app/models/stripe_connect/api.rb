require 'stripe'
module StripeConnect
  # Class for setting basic api credentials
  class Api
    def self.set_key(access_token)
      Stripe.api_key = access_token
    end
  end
end
