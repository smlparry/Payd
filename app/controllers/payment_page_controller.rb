class PaymentPageController < ApplicationController
  def show
    @plan = Plan.where(uid: params[:id]).first
    redirect_with_error(root_path, 'Plan could not be found') unless @plan
  end
end
