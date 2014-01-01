module Requests
  module SessionHelpers
    def sign_in_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = User.last
      @current_user ||= User.create!(email: 'john@example.com', password: 'passoword')
      sign_in @current_user
      @current_user
    end

    def current_user
      @current_user
    end
  end
end