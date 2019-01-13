class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth

private

# RailsアプリへのBasic認証導入用,環境変数
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
