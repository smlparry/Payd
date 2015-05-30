require 'rails_helper'

RSpec.describe 'Stripe', type: :request do
  before do
    sign_in_as_a_valid_user
  end

  describe 'GET /dash/account/stripe' do
    def visit_with_stripe_user
      @stripe_user = Fabricate(:stripe_user, user_id: @user.id)
      visit dash_account_stripe_index_path
    end

    it 'shows a connect stripe button' do
      visit dash_account_stripe_index_path
      expect(page).to have_content('Connect Stripe')
    end

    it 'doesnt show a connect stripe button' do
      visit_with_stripe_user
      expect(page).to_not have_content('Connect Stripe')
    end

    it 'makes sure the user knows stripe has been connected' do
      visit_with_stripe_user
      expect(page).to have_content('Your Stripe Account is connected')
    end

    it 'shows a disconnect stripe button' do
      @stripe_user = Fabricate(:stripe_user, user_id: @user.id)
      visit dash_account_stripe_index_path
      expect(page).to have_content('Disconnect your Stripe Account')
    end
  end
end
