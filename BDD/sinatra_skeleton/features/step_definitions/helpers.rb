module Helpers

  def create user, password
    User.create(username: user, password: password)
  end

  def login user
    visit '/'
    fill_in('username', with: text_field)
    fill_in('password', with: text_field)


  end

end