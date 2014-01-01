module Requests
  module SessionHelpers
    def sign_in_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = User.last
      @current_user ||= FactoryGirl.create(:user)
      sign_in @current_user
      @current_user
    end

    def current_user
      @current_user
    end

    def sign_in_admin
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @current_admin = Admin.last
      @current_admin ||= FactoryGirl.create(:admin)
      sign_in @current_admin
      @current_admin
    end

    def current_admin
      @current_admin
    end
  end
end