helpers do

  def current_user
    @user ||= User.find_by(id: session[:id])
  end

  def logged_in?
    !!current_user
  end

end
