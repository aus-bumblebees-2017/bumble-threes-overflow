get '/sessions/new' do

  erb :'users/login'
end

post '/sessions' do
  @user = User.authenticate(params[:username], params[:password])
  if @user.valid?
    sessions[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  end
end
