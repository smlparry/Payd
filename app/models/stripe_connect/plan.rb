module StripeConnect
  # Stripe connect wrapper for creating plans
  class Plan < StripeConnect::Api
    def self.create(plan, access_token)
      set_key(access_token)
      begin
        Stripe::Plan.create(amount: plan.amount,
                            interval: plan.interval_type,
                            interval_count: plan.interval_count,
                            name: plan.name,
                            currency: plan.currency,
                            id: plan.stripe_id,
                            trial_period_days: plan.trial_period_days)
      rescue
        return { error: 'Unable to create plan on Stripe' }
      end
    end

    def self.update(plan, access_token)
      set_key(access_token)
      begin
        stripe_plan = Stripe::Plan.retrieve(plan.stripe_id)
        stripe_plan.name = plan.name
        stripe_plan.save
      rescue
        return { error: 'Unable to update plan on Stripe' }
      end
    end

    def self.delete(plan, access_token)
      set_key(access_token)
      begin
        stripe_plan = Stripe::Plan.retrieve(plan.stripe_id)
        stripe_plan.delete
      rescue
        return { error: 'Unable to delete plan on Stripe' }
      end
    end
  end
end
