get '/' do
  @user = User.new
  erb :'/users/new'
end

get '/users/new' do
  @user = User.new
  erb :'/users/new'
end

get '/users/show/:id' do
  @user = User.find(params[:id])
  erb :'/users/show'
end
