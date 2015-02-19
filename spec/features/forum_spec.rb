require 'spec_helper'
require_relative '../../lib/app.rb'
require 'helpers'

feature 'Posting to the forum' do

  include Helpers

  scenario 'A user should be able to post to the forum' do
    sign_up
    click_link 'FORUM'
    fill_in :post, with: 'what time are we playing?'
    expect(page).to have_content 'What time are we playing?'
  end

end
