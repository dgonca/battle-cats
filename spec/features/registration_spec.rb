require "spec_helper"
require "capybara/rspec"

feature "Registering as a new user" do

	scenario "redirects to the user show page when valid credentials are provided" do
		visit('/users/new')

		fill_in('Email', with: 'tom@tom.com')
		fill_in('Password', with: 'tomtom')
		fill_in('Password confirmation', with: 'tomtom')

		click_button('Register')
		expect(page).to have_content("All Pets")
	end

	scenario "redirects back to the login page when erroneous input is provided" do
		visit('/users/new')

		fill_in('Email', with: 'fake@bogus.com')
		fill_in('Password', with: 'NOPE')
		fill_in('Password confirmation', with: "nonono!")

		click_button('Register')
		expect(page).to have_current_path("/users")
	end
end