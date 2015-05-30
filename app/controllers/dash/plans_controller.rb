module Dash
  # Restful resource Plan
  class PlansController < ApplicationController
    before_action :authenticate_user!
    before_action :this_plan,
                  :users_plan?,
                  only: [:show,
                         :edit,
                         :update,
                         :destroy]
    def index
      @plans = current_user ? current_user.plans.reverse_order : []
    end

    def new
      @plan = Plan.new
      @stripe_user = current_user.stripe_user
    end

    def create
      # Attempt to store this plan
      @plan = Plan.new.store_form_params(params, current_user.id)
      return redirect_with_invalid(new_dash_plan_path,
                                   @plan.errors) unless @plan.valid?
      # Add to stripe
      @plan.add_stripe_plan
      # A Hash with an error key is returned if could not make plan on stripe
      return redirect_with_error(new_dash_plan_path,
                                 @plan[:error]) if @plan[:error]

      redirect_with_notice(dash_plans_path,
                           "Successfully Created plan #{@plan.name}")
    end

    def show
    end

    def edit
      @stripe_user = current_user.stripe_user
    end

    def update
      # Can only update plan name
      @plan.update_name(params)
      return redirect_with_invalid(edit_dash_plan_path(@plan.id),
                                   @plan.errors) unless @plan.valid?
      # Update with stripe
      @plan.update_stripe_plan
      return redirect_with_error(edit_dash_plan_path(@plan.id),
                                 @plan[:error]) if @plan[:error]
      # Success
      redirect_with_notice(dash_plans_path,
                           "Successfully Updated plan #{@plan.name}")
    end

    def destroy
      # Remove intance from stripe
      @plan.delete_stripe_plan
      return redirect_with_error(dash_plans_path,
                                 @plan[:error]) if @plan[:error]
      # Remove local instance
      @plan.destroy

      redirect_with_notice(dash_plans_path,
                           'Successfully deleted plan')
    end

    private

    def this_plan
      @plan = Plan.find_by_id(params[:id])
      redirect_with_error(dash_home_path 'Plan does not exist') unless @plan
    end

    def users_plan?
      redirect_with_error(dash_home_path, 'Unauthorised access') if @plan.user_id != current_user.id
      true
    end
  end
end
