get '/sessions/new' do

  erb :'users/login'
end

post '/sessions' do
  @user = User.authenticate(params[:username], params[:password])
  if !@user.nil?
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = "Invalid username or password"
    erb :'users/login'
  end
end
