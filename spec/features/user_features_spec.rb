require_relative "../rails_helper.rb"

describe 'Feature Test: Before Log In', type: :feature do

    describe 'Home page' do

        it 'has welcome page' do
            visit '/'
            expect(page).to have_content("Welcome")
            
        end

        it 'has signup links' do
            visit '/'
            expect(page).to have_link("Create New Owner")
            expect(page).to have_link("Create New Trainer")
        end

        it 'has login links' do
            visit '/'
            expect(page).to have_link("Log In with Credentials")
            expect(page).to have_link("Log In with Facebook")
            expect(page).to have_link("Log In with Google")
        end

    end

    describe "Login Page" do

        it "has forms for user and trainer logins" do
            visit '/signin'
            expect(page).to have_link("Log In as Owner")
            expect(page).to have_link("Log In as Trainer")
        end

    end
end

describe 'Feature Test: User Signup', :type => :feature do



    it 'successfully signs up as non-admin' do
        visit '/users/new'
        expect(current_path).to eq('/users/new')
        # user_signup method is defined in login_helper.rb
        user_signup
        expect(current_path).to eq('/users/1')
        expect(page).to have_content("Amy Poehler")
        expect(page).to have_content("555-555-5555")
        expect(page).to have_content("AP@test.com")
        expect(page).to have_content("AP_Dog")
    end

    it "on sign up, successfully adds a session hash" do
        visit '/users/new'
        # user_signup method is defined in login_helper.rb
        user_signup
        expect(page.get_rack_session_key('user_id')).to_not be_nil
    end

    it 'successfully logs in as non-admin' do
        
        # user_login method is defined in login_helper.rb
        create_standard_user
        visit '/signin'
        expect(current_path).to eq('/signin')
        user_login
        expect(current_path).to eq('/users/1')
        expect(page).to have_content("Amy Poehler")
        expect(page).to have_content("555-555-5555")
        expect(page).to have_content("AP@test.com")
        expect(page).to have_content("AP_Dog")
    end

    it "on log in, successfully adds a session hash" do
        create_standard_user
        visit '/signin'
        # user_login method is defined in login_helper.rb
        user_login
        expect(page.get_rack_session_key('user_id')).to_not be_nil
    end

    it 'prevents user from viewing user show page and redirects to home page if not logged in' do
        create_standard_user
        visit '/users/1'
        expect(current_path).to eq('/')
        expect(page).to have_content("Sign Up")
    end

    it 'successfully signs up as admin' do
        visit '/trainers/new'
        expect(current_path).to eq('/trainers/new')
        # admin_signup method is defined in login_helper.rb
        admin_signup
        expect(current_path).to eq('/trainers/1')
        expect(page).to have_content("Walt Disney")
        expect(page).to have_content("TRAINER")
    end

    it "on sign up for admin, successfully adds a session hash" do
        visit '/trainers/new'
        # admin_signup method is defined in login_helper.rb
        admin_signup
        expect(page.get_rack_session_key('user_id')).to_not be_nil
    end

end