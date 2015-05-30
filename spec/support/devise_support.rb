# This support package contains modules for authenticaiting
# devise users for request specs.
include Warden::Test::Helpers

# This module authenticates users for request specs.#
module ValidUserRequestHelper
  # Define a method which signs in as a valid user.
  def sign_in_as_a_valid_user
    @user ||= Fabricate(:user)
    page.driver.post user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
  end
end

# Configure these to modules as helpers in the appropriate tests.
RSpec.configure do |config|
  # Include the help for the request specs.
  config.include ValidUserRequestHelper, type: :request
end
