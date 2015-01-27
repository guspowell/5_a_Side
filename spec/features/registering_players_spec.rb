require 'spec_helper'

feature "User wants to register" do

  scenario "When being a new player visiting the website" do
    visit '/'
    expect(page).to have_content("Not on the system? Enter a username")
  end

end
