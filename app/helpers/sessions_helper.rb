helpers do

  def current_user
    @user||= User.find(id: session[:user_id])
  end

  def logged_in?
    !!current_user.valid?
  end

end
