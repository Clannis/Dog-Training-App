module LoginHelper

  def user_signup
    fill_in("user[first_name]", :with => "Amy")
    fill_in("user[last_name]", :with => "Poehler")
    fill_in("user[username]", :with => "AP_Dog")
    fill_in("user[phone_number]", :with => "555-555-5555")
    fill_in("user[email]", :with => "AP@test.com")
    fill_in("user[password]", :with => "password")
    click_button('Create User')
  end

  def user_login
    fill_in("username", :with => "AP_Dog")
    fill_in("password", :with => "password")
    click_button('Sign In')
  end

  def admin_signup
    fill_in("trainer[username]", :with => "WD_Train")
    fill_in("trainer[first_name]", :with => "Walt")
    fill_in("trainer[last_name]", :with => "Disney")
    fill_in("trainer[phone_number]", :with => "555-555-5555")
    fill_in("trainer[email]", :with => "Disney@test.com")
    fill_in("trainer[certifiaction]", :with => "Top Dog Academy")
    fill_in("trainer[password]", :with => "password")
    click_button('Create Trainer')
  end

  def admin_login
    fill_in("username", :with => "WD_Train")
    fill_in("password", :with => "password")
    click_button('Sign In')
  end

  def create_standard_user 
    @mindy = User.create(
      first_name: "Mindy",
      last_name: "Whaller",
      password: "password",
      phone_number: "555-555-5555",
      email: "Mindy@test.com",
      username: "Mindy_Dog"
    )
  end

  def create_standard_and_admin_user
    @mindy = User.create(
      first_name: "Mindy",
      last_name: "Whaller",
      password: "password",
      phone_number: "555-555-5555",
      email: "Mindy@test.com",
      username: "Mindy_Dog"
    )
    @walt = User.create(
      user_name: "WD_Train",
      first_name: "Walt",
      last_name: "Disney",
      phone_number: "555-555-5556",
      email: "Disney@test.com",
      certification: "Top Dog Academy",
      password: "password"
    )
  end
  
end