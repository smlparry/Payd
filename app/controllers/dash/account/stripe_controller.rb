module Dash
  module Account
    # Controller to manage all stripe account functionality
    class StripeController < ApplicationController
      def index
      end

      # This is the endpoint for users coming back to the site
      # via the oAuth flow
      def new
        code = params[:code]
        request = StripeConnect.make_request(code) if code
        return redirect_with_error(dash_account_stripe_index_path,
                                   'Unable to contact stripe') unless request
        StripeUser.new.make_from_request(request, current_user.id)
        # Success
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
    end
  end
end
