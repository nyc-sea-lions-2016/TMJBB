enable :sessions

# CREATE
post '/register' do
  @user = User.create(params[:user])
  session[:id] = @user.id
  redirect "/users/show/#{@user.id}"
end

get '/login' do
  @user = User.new
  erb :'/sessions/new'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect "/users/show/#{@user.id}"
  else
    @errors = "you messed up"
    erb :'/sessions/new'
  end

end

get '/logout' do
  session.clear
  redirect '/'
end
