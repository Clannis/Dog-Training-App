require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {
    User.create(
      :username => "MindyPoo",
      :first_name => "Mindy",
      :last_name => "Stevens",
      :password => "password",
      :phone_number => "555-555-5555",
      :email => "Mindy@test.com"
    )
  }

  it "is valid with a username, first and last name, password, phone number, and email" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(username: "Name")).not_to be_valid
  end

end
