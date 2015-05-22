module Dash
  class PlansController < ApplicationController
    before_action :plan_id, :is_users_plan, only: [:show, :edit]
    def index
      @plans = current_user.plans
    end

    def new
      @plan = Plan.new
    end

    def create
      @plan_params = params
      begin
        @plan = Plan.new
        @plan.user_id = current_user.id
        @plan.name = params[:plan][:name]
        @plan.amount = params[:plan][:amount]
        @plan.period_amount = params[:plan][:period_amount]
        @plan.period_type = params[:plan][:period_type]
        @plan.save
      rescue
        redirect_to new_dash_plans_path, flash: { error: "An error occured adding your plan" }
        return
      end
      redirect_to dash_plans_path, flash: { notice: "Successfully added plan: #{@plan.name}" }
    end

    def show

    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def plan_id
      begin
        @plan = Plan.find(params[:id])
      rescue
        redirect_to dash_home_path, :flash => { error: 'Plan does not exist' }
      end

    end
    def is_users_plan
      if @plan.user_id != current_user.id
        redirect_to dash_home_path, :flash => { error: 'You do not own this plan' }
      end
    end
  end
end
