module StripeConnect
  # Stripe connect wrapper for creating plans
  class Plan < StripeConnect::Api
    def self.plan_id(uid)
      'payd_' + uid
    end

    def self.create(plan, access_token)
      set_key(access_token)
      begin
        Stripe::Plan.create(amount: plan.amount,
                            interval: plan.interval_type,
                            interval_count: plan.interval_count,
                            name: plan.name,
                            currency: plan.currency,
                            id: plan_id(plan.uid),
                            trial_period_days: plan.trial_period_days)
      rescue
        return { error: 'Unable to create plan on Stripe' }
      end
    end

    def self.retrieve(plan, access_token)
      set_key(access_token)
      Stripe::Plan.retrieve(plan_id(plan.uid))
    end

    def self.update(plan, access_token)
      stripe_plan = retrieve(plan, access_token)
      stripe_plan.name = plan.name
      stripe_plan.save
      rescue
        return { error: 'Unable to update plan on Stripe' }
    end

    def self.delete(plan, access_token)
      stripe_plan = retrieve(plan, access_token)
      stripe_plan.delete
      rescue
        return { error: 'Unable to delete plan on Stripe' }
    end
  end
end
