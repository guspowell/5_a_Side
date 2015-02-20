require 'spec_helper'
require_relative '../../lib/app.rb'
require 'helpers'

feature 'Posting to the forum' do

  include Helpers

  scenario 'A user should be able to post to the forum' do
    sign_up
    click_link 'FORUM'
    expect(page).to have_selector('.forum-post')
  end

  scenario 'A user is able to make a post' do
    sign_up
    click_link 'FORUM'
    fill_in :post, with: 'What time are we playing?'
    click_button 'post'
    expect(page).to have_content 'What time are we playing?'
    p Post.first.player.username.inspect
  end

  scenario 'You should be able to post multiple posts' do
    sign_up
    click_link 'FORUM'
    fill_in :post, with: 'What time are we playing?'
    click_button 'post'
    fill_in :post, with: 'Hello'
    click_button 'post'
    expect(page).to have_content 'What time are we playing?'
    expect(page).to have_content 'Hello'

  end

end
