get '/sessions/new' do

  erb :'users/login'
end

post '/sessions' do
  @user = User.authenticate(params[:username], params[:password])
  if @user.valid?
    redirect "/users/#{@user.id}"
  end
end
