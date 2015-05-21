module Dash
  module Account
    class StripeController < ApplicationController
      include HTTParty

      def index
      end

      def new
        # This is the endpoint for users coming back to the site via the oAuth flow
        if ! params[:access_denied]
          code = params[:code]
          if code
            response = HTTParty.post("https://connect.stripe.com/oauth/token",
                                     :query => { client_secret: STRIPE_CONFIG["secret_key"],
                                                 code: code,
                                                 grant_type: "authorization_code" })
            if ! response[:error]
              stripe_user = StripeUser.new
              stripe_user.user_id = current_user.id
              stripe_user.stripe_publishable_key = response[:stripe_publishable_key]
              stripe_user.stripe_user_id = response[:stripe_user_id]
              stripe_user.livemode = response[:livemode]
              stripe_user.refresh_token = response[:refresh_token]
              stripe_user.access_token = response[:access_token]
              stripe_user.save

              # Success so redirect
              redirect_to dash_home_path
            else
              @error_type = response[:error]
              @error_message = response[:error_description]
            end
          else
            redirect_to dash_account_stripe_index_path, :flash => { error: "We could not find an authorization code, please try again" }
          end
        else
          @error_type = params[:error]
          @error_message = params[:error_description]
        end
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
