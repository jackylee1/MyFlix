# for unit tests:

def set_current_user(admin=nil)
  session[:user_id] = (admin || Fabricate(:admin)).id
end

def set_current_admin(user=nil)
  session[:user_]

# for feature spec:

def login(a_user=nil)
  user = a_user || Fabricate(:user)
  visit login_path
  fill_in "Email", with: user.email
  fill_in "password", with: user.password
  click_button "Sign in"
end

def logout
  visit logout_path
end

def click_on_video_on_home_page(video)
  find("a[href='/videos/#{video.id}']").click
end

