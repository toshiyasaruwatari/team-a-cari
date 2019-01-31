require "rails_helper"

describe "UserFeature" do

  describe "signup via facebook" do

    before do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      visit root_path
      click_link "ログイン"
    end

    it "Users increase when they do signup" do
      expect{
        click_link "Facebookでログイン"
      }.to change(User, :count).by(1)
    end

    it "The accepted users do not increase anymore" do
      click_link "Facebookでログイン"
      click_link "ログアウト"
      click_link "ログイン"
      expect{
        click_link "Facebookでログイン"
      }.not_to change(User, :count)
    end

  end

  describe "signup via google" do

    before do
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      Rails.application.env_config['omniauth.auth'] = google_mock
      visit root_path
      click_link "ログイン"
    end

    it "Users increase when they do signup" do
      expect{
        click_link "Googleでログイン"
      }.to change(User, :count).by(1)
    end

    it "The accepted users do not increase anymore" do
      click_link "Googleでログイン"
      click_link "ログアウト"
      click_link "ログイン"
      expect{
        click_link "Googleでログイン"
      }.not_to change(User, :count)
    end

  end
end
