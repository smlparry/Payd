# Used for stripe connect functionality
class StripeConnect
  include HTTParty

  def self.make_request(code)
    HTTParty.post('https://connect.stripe.com/oauth/token',
                  query: {
                    client_secret: STRIPE_CONFIG['secret_key'],
                    code: code,
                    grant_type: 'authorization_code'
    }) || code
  end

  def self.get_user_details(user_id)
    Stripe.api_key = STRIPE_CONFIG['secret_key']
    account = Stripe::Account.retrieve(user_id)
    p account
  end
end
