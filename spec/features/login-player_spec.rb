require 'spec_helper'

feature 'player wants to login' do

  before(:each) do
    Player.create(:username => 'messi')
  end

  scenario 'visiting the homepage as an existing player and logging in' do
    visit ('/')
    expect(page).not_to have_content('Welcome messi')
    login
    save_and_open_page
    expect(page).to have_content('Welcome messi')
  end

end


def login(username = 'messi')
  visit '/'
  fill_in :username_login, :with => username
  click_button 'submit-login'
end
