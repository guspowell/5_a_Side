require 'spec_helper'

feature "User wants to register" do


  scenario "visiting the website" do
    visit '/'
    expect(page).to have_content("Not on the system? Enter a username")
  end

  scenario "being a new player and registering" do
    visit '/'
    fill_in :username_register, :with => 'ronaldo'
    click_button 'submit-register'
    p Player.first.inspect
    expect(Player.first.username).to eq('ronaldo')
  end

end
