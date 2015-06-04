require 'stripe'
# Subscription plan
class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :subscribers

  validates :user_id,
            :name,
            :amount,
            :interval_count,
            :currency,
            :interval_type,
            presence: true

  validates :interval_count,
            :amount,
            numericality: { only_integer: true }

  validates :interval_count, numericality: { less_than: 12 }

  # Assign values from a form input
  def store_form_params(params, user_id = nil)
    self.uid = Helpers::StringHelpers.random_string if user_id
    self.user_id = user_id
    self.name = params[:plan][:name]
    self.amount = params[:plan][:amount].sub! '.', ''
    self.interval_count = params[:plan][:interval_count]
    self.interval_type = params[:plan][:interval_type]
    self.trial = (params[:plan][:trial_period_days]) ? true : false
    self.trial_period_days = params[:plan][:trial_period_days]
    self.currency = params[:plan][:currency]
    self
  end

  def update_name(params)
    self.name = params[:plan][:name]
    self
  end

  # Add the plan to the stripe server
  def add_stripe_plan
    save
    StripeConnect::Plan.create(self, user.stripe_user.access_token)
  end

  # Update a stripe plan
  def update_stripe_plan
    save
    StripeConnect::Plan.update(self, user.stripe_user.access_token)
  end

  def delete_stripe_plan
    StripeConnect::Plan.delete(self, user.stripe_user.access_token)
  end
end
