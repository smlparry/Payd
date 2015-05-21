module Dash
  class PlansController < ApplicationController
    def index
      @plans = current_user.plans
    end

    def new
      @plan = Plan.new
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end
  end
end
