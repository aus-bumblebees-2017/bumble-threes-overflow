before '/votes/*' do

  current_user
  redirect '/sessions/new' if @user.nil?
end
get '/votes' do
  @votes = Vote.all
  erb :'votes/index'
end
get '/votes/:id/delete' do
  @vote = Vote.find(params[:id])
  redirect "/votes/#{params[:id]}" if @user!=@vote.author

  @vote.delete

# NOTE: need to go back to invoking site.
  redirect '/votes'

end

get '/votes/:id/upvote' do
  @vote = Vote.find(params[:id])
  redirect "/votes/#{params[:id]}" if @user!=@vote.author

  @vote.weight=1
  @vote.save

  erb :'votes/vote', locals: {vote: @vote}

end
get '/votes/:id/downvote' do
  @vote = Vote.find(params[:id])
  redirect "/votes/#{params[:id]}" if @user!=@vote.author

  @vote.weight=-1
  @vote.save

  erb :'votes/vote', locals: {vote: @vote}

end
get '/votes/:id/nullvote' do
  @vote = Vote.find(params[:id])
  redirect "/votes/#{params[:id]}" if @user!=@vote.author

  @vote.weight=0
  @vote.save

  erb :'votes/vote', locals: {vote: @vote}

end
