require 'spec_helper'
require 'helpers'

feature "Player wants to register" do

  include Helpers

  scenario "visiting the website" do
    visit '/'
    expect(page).to have_selector('.login-button')
  end

  scenario "being a new player and registering" do
    sign_up
    expect(Player.first.username).to eq('ronaldo')
  end

  scenario "trying to register with a username already in the system" do
    expect{sign_up}.to change(Player, :count).by 1
    expect{sign_up}.to change(Player, :count).by 0
    expect(page).to have_content('This username is already taken')
  end

  scenario "leaving the username field blank" do
    sign_up('')
    expect(page).to have_content('Please enter a valid username')
  end

  scenario "show a message to greet the user" do
    sign_up
    expect(page).to have_content('Welcome ronaldo')
  end

end
