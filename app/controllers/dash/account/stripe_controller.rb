module Dash
  module Account
    # Controller to manage all stripe account functionality
    class StripeController < ApplicationController
      before_action :authenticate_user!

      def index
        @stripe_user = current_user.stripe_user
      end

      # This is the endpoint for users coming back to the site
      # via the oAuth flow
      def new
        code = params[:code]
        response = StripeConnect::Connect.make_connect_request(code) if code
        return redirect_with_error(dash_account_stripe_index_path,
                                   'Unable to contact stripe') unless response
        StripeUser.new.create_from_response(response, current_user.id)
        redirect_to dash_home_path
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

      def disconnect
        redirect_with_error(dash_account_stripe_index_path,
                            'Has not been implemented yet')
      end
    end
  end
end
