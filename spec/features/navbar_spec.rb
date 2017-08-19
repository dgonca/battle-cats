require "spec_helper"
require "capybara/rspec"

feature "clicking on the nav bar" do

	scenario "redirects to the sessions new page when the log in link is clicked" do
		visit('/')

		click_link('Log In')
		expect(page).to have_current_path("/sessions/new")
	end

	scenario "redirects to the registration page when the register link is clicked" do
		visit('/')
		click_link('Register')
		expect(page).to have_current_path new_user_path
	end
end