module Helpers

  def add_and_available_players(num)
    i = 0
      while i < num do
        app.add_player("#{i} rooney")
        app.available("#{i} rooney")
        i += 1
      end
  end

  def adding_different_players(num)
    i = 0
    while i < num do
      Player.create(:username => "#{i} rooney")
      visit ('/')
      login("#{i} rooney")
      click_button 'AVAILABLE'
      i += 1
    end
  end

  def sign_up(username = 'ronaldo')
    visit '/'
    click_link 'Click here to register'
    fill_in :username_register, :with => username
    click_button 'Register'
  end

  def login(username)
    visit '/'
    fill_in :username_login, :with => username
    click_button 'Login'
    visit '/session'
  end

end
