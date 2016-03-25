enable :sessions

get '/users/login' do
  @user = User.new
  erb :'/users/login'
end

get '/users' do
  @user = User.find_by(username: params[:user][:username])
  redirect "/users/show/#{@user.id}"
end
