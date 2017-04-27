get '/users/new' do

  erb :'users/new'
end

post '/users' do
  @user = User.new({username: params[:username], email: params[:email]})


end
