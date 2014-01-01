module Features
  module SessionHelpers
    def sign_up_with(name, email, password)
      visit new_user_registration_path

      fill_in 'user[name]', with: name
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password

      click_button 'Cadastrar'

      User.find_by(email: email)
    end

    def sign_in
      user = User.create!(name: 'John Doe', email: 'john@example.com', password: '12345678')

      visit new_user_session_path

      within('.panel-login') do
        fill_in 'user[email]', with: 'john@example.com'
        fill_in 'user[password]', with: '12345678'

        click_button 'Entrar'
      end

      user
    end
  end
end