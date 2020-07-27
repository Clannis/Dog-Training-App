require_relative "../rails_helper.rb"

describe 'Feature Test: Before Log In', type: :feature do

    describe 'Home page' do

        it 'has welcome page' do
            visit '/'
            expect(current_path).to eq('/home')
            expect(page).to have_content("Welcome")
            
        end

        it 'has signup link' do
            visit '/'
            expect(page).to have_content("Sign Up")
        end
    end
end


############################################################
#               Left in for reference                      #
############################################################

# describe 'Feature Test: User Signup', :type => :feature do



#     it 'successfully signs up as non-admin' do
#         visit '/users/new'
#         expect(current_path).to eq('/users/new')
#         # user_signup method is defined in login_helper.rb
#         user_signup
#         expect(current_path).to eq('/users/1')
#         expect(page).to have_content("Amy Poehler")
#         expect(page).to have_content("Mood")
#         expect(page).to have_content("happy")
#         expect(page).to have_content("15")
#         expect(page).to have_content("58")
#     end

#     it "on sign up, successfully adds a session hash" do
#         visit '/users/new'
#         # user_signup method is defined in login_helper.rb
#         user_signup
#         expect(page.get_rack_session_key('user_id')).to_not be_nil
#     end

#     it 'successfully logs in as non-admin' do
        
#         # user_login method is defined in login_helper.rb
#         create_standard_user
#         visit '/signin'
#         expect(current_path).to eq('/signin')
#         user_login
#         expect(current_path).to eq('/users/1')
#         expect(page).to have_content("Mindy")
#         expect(page).to have_content("Mood")
#         expect(page).to have_content("happy")
#         expect(page).to have_content("10")
#         expect(page).to have_content("50")
#     end

#     it "on log in, successfully adds a session hash" do
#         create_standard_user
#         visit '/signin'
#         # user_login method is defined in login_helper.rb
#         user_login
#         expect(page.get_rack_session_key('user_id')).to_not be_nil
#     end

#     it 'prevents user from viewing user show page and redirects to home page if not logged in' do
#         create_standard_user
#         visit '/users/1'
#         expect(current_path).to eq('/')
#         expect(page).to have_content("Sign Up")
#     end

#     it 'successfully signs up as admin' do
#         visit '/users/new'
#         expect(current_path).to eq('/users/new')
#         # admin_signup method is defined in login_helper.rb
#         admin_signup
#         expect(current_path).to eq('/users/1')
#         expect(page).to have_content("Walt Disney")
#         expect(page).to have_content("ADMIN")
#     end

#     it "on sign up for admin, successfully adds a session hash" do
#         visit '/users/new'
#         # admin_signup method is defined in login_helper.rb
#         admin_signup
#         expect(page.get_rack_session_key('user_id')).to_not be_nil
#     end

# end