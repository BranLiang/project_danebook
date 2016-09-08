module LoginMacros
  def sign_in(user)
    visit root_path
    within(".top-nav") do
      fill_in "Email",    with: user.email
      fill_in "Password", with: user.password
    end
    click_button "Log in"
  end

  def sign_out
    click_link "Logout"
  end
end
