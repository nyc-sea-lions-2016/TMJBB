enable :sessions

post '/users/create' do
  @user = User.create(params[:user])
  session[:id] = @user.id
  redirect "/users/show/#{@user.id}"
end

get '/users/login' do
  @user = User.new
  erb :'/users/login'
end

get '/users' do
  user = User.new(params[:user])
  @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    redirect "/users/show/#{@user.id}"
  else
    erb :'/users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/users/login'
end
