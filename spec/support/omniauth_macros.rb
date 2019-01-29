module OmniauthMacros

  def facebook_mock
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        provider: 'facebook',
        uid: '11111',
        info: {
          name: 'mockuser',
          email: 'sample@test.com'
        }
      }
    )
  end

  def google_mock
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      {
        provider: 'google',
        uid: '11111',
        info: {
          name: 'mockuser',
          email: 'sample@test.com'
        }
      }
    )
  end

end
