require 'stripe'
# Stripe Connect user account details
class StripeUser < ActiveRecord::Base
  # relations
  belongs_to :user

  # Makes a new stripe user with oAuth response
  def create_from_response(response, user_id)
    save_from_response(response, user_id)
    stripe_account = stripe_user_account_details
    save_user_account_details(stripe_account) if stripe_account
  end

  def stripe_user_account_details
    Stripe.api_key = STRIPE_CONFIG['secret_key']
    Stripe::Account.retrieve(stripe_user_id)
  end

  def save_from_response(response, user_id)
    self.user_id = user_id
    self.stripe_publishable_key = response['stripe_publishable_key']
    self.stripe_user_id = response['stripe_user_id']
    self.livemode = response['livemode']
    self.refresh_token = response['refresh_token']
    self.access_token = response['access_token']
    save
  end

  def save_user_account_details(account)
    self.email = account['email']
    self.country = account['country']
    self.phone_number = account['phone_number']
    self.default_currency = account['default_currency']
    self.currencies_supported = account['currencies_supported']
    self.name = account['display_name']
    self.country = account['country']
    self.timezone = account['timezone']
    self.charge_enabled = account['charge_enabled']
    self.business_logo = account['business_logo']
    self.business_name = account['business_name']
    self.business_url = account['business_url']
    save
  end
end
