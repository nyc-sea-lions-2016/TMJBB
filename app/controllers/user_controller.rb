post '/users/create' do
  @user = User.create(params[:user])
  session[:id] = @user.id
  redirect "/users/show/#{@user.id}"
end

get '/users/show/:id' do
  @user = User.find_by_id(:id)
  erb :'/users/show'
end
