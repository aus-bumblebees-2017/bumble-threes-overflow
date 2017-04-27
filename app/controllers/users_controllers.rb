get '/users/new' do

  erb :'users/new'
end

post '/users' do
  @user = User.new({username: params[:username], email: params[:email]})
  @user.password = params[:hash_pw]
  @user.save
  if @user.valid?
    redirect '/sessions/new'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:id' do

  erb :'users/home'
end

delete '/users/:id' do
  user = User.find_by_id(params[:id])
  #maybe delete all its info? or make it annonymous
  user.destroy
  redirect "/"
end
