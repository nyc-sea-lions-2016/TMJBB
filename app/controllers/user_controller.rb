get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

post '/users/create' do
  @user = User.create(params[:user])
  session[:id] = @user.id
  redirect "/users/show/#{@user.id}"
end

get '/users/show/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end
