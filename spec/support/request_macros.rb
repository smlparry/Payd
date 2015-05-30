# Some helpful functions to use in tests
module RequestMacros
  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = Fabricate(:user)
      sign_in user
    end
  end
end
