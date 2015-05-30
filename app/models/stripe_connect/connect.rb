module StripeConnect
  # Handles connection requests
  class Connect < StripeConnect::Api
    include HTTParty

    # Makes a request to stripe
    def self.make_connect_request(code)
      HTTParty.post('https://connect.stripe.com/oauth/token',
                    query: {
                      client_secret: STRIPE_CONFIG['secret_key'],
                      code: code,
                      grant_type: 'authorization_code'
                    })
    end
  end
end
