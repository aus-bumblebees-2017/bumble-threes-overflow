get '/users/new' do

  erb :'users/new'
end

post '/users' do
  @user = User.new({username: params[:username], email: params[:email]})
  @user.password = params[:hash_pw]
  @user.save
  redirect '/sessions/new'
end
