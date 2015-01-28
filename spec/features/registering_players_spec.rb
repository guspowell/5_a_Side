require 'spec_helper'

feature "User wants to register" do

  scenario "visiting the website" do
    visit '/'
    expect(page).to have_content("Not on the system? Enter a username")
  end

  # scenario "being a new player and registering" do
  #   visit '/'
  #   fill_in :username, :with => username
  #   click_button 'submit-register'
  # end

end
