require 'spec_helper'
require 'helpers'

feature 'Player wants to login' do

  include Helpers

  before(:each) do
    Player.create(:username => 'messi')
  end

  scenario 'visiting the homepage as an existing player and logging in' do
    visit ('/')
    expect(page).not_to have_content('Welcome messi')
    login('messi')
    expect(page).to have_content('Welcome messi')
  end

  scenario 'logging in with incorrect username' do
    visit ('/')
    expect(page).not_to have_content('Welcome messi')
    login('bale')
    expect(page).to have_content('This username is not in the system')
  end

end
