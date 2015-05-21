class DashController < ApplicationController
  before_action :authenticate_user!

  def home
    @stripe_user = current_user.stripe_user
  end
  def subscribers
  end
  def transactions
  end
  def plans
  end
  def account
    @stripe_user = current_user.stripe_user
  end
end
