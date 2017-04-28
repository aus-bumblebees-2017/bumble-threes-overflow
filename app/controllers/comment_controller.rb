before '/comments*' do
  current_user
end

get '/comments' do
  @comments = Comment.all

  erb :'comments/index'
end
get '/comments/new' do
  redirect '/sessions/new' if @user.nil?

  erb :'comments/new'
end
post '/comments/new' do
  redirect '/sessions/new' if @user.nil?
  if current_user == nil
    @comment=Comment.create(description: params[:comment_description])
  else
    @comment=Comment.create(
      description: params[:comment_description],
      author: current_user
      )
  end

  erb :"comments/comment", locals: {comment: @comment}
end
get '/comments/:id' do
  @comment = Comment.find(params[:id])

  erb :'comments/comment', locals: {comment: @comment}

end
get '/comments/:id/edit' do
  redirect '/sessions/new' if @user.nil?
  @comment = Comment.find(params[:id])

  erb :'comments/edit'

end
get '/comments/:id/upvote' do
  redirect '/sessions/new' if @user.nil?
  @comment = Comment.find(params[:id])
  Vote.add_vote(@comment,1,current_user)
  erb :'comments/comment', locals: {comment: @comment}

end
get '/comments/:id/downvote' do
  redirect '/sessions/new' if @user.nil?
  @comment = Comment.find(params[:id])
  Vote.add_vote(@comment,-1,current_user)
  erb :'comments/comment', locals: {comment: @comment}

end
get '/comments/:id/nullvote' do
  redirect '/sessions/new' if @user.nil?
  @comment = Comment.find(params[:id])
  Vote.add_vote(@comment,0,current_user)
  erb :'comments/comment', locals: {comment: @comment}

end
post '/comments/:id/edit' do
  redirect '/sessions/new' if @user.nil?
  @comment=Comment.find(params[:id])
  @comment.description = params[:comment_description]
  @comment.save
  erb :'comments/comment', locals: {comment: @comment}
end
get '/comments/:id/delete' do
  redirect '/sessions/new' if @user.nil?
  @comment = Comment.find(params[:id]).delete

# NOTE: need to go back to invoking site.
  redirect '/comments'

end

