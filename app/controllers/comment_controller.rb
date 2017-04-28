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
post '/comments/new/:id/:type' do
  redirect '/sessions/new' if @user.nil?
  if current_user == nil
    @comment=Comment.create(description: params[:comment_description])
  else
    @comment=Comment.create(
      description: params[:comment_description],
      author: current_user
      )
  end
  if params[:type] == "q"
    commentable = Question.find(params[:id])
    commentable.comments << @comment
    commentable.save
    redirect back
  else
    commentable = Answer.find(params[:id])
    commentable.comments << @comment
    commentable.save
    question = commentable.question
    redirect "/questions/#{question.id}"
  end

  # erb :"comments/comment", locals: {comment: @comment}
end
get '/comments/:id' do
  @comment = Comment.find(params[:id])

  erb :'comments/comment', locals: {comment: @comment}

end
get '/comments/:id/edit' do
  redirect '/sessions/new' if @user.nil?
  @comment = Comment.find(params[:id])
  redirect "/comments/#{params[:id]}" if @user!=@comment.author

  erb :'comments/edit'

end
get '/comments/:id/upvote' do
  redirect '/sessions/new' if @user.nil?
  @comment = Comment.find(params[:id])
  Vote.add_vote(@comment,1,current_user)
  redirect back

  # erb :'comments/comment', locals: {comment: @comment}

end
get '/comments/:id/downvote' do
  redirect '/sessions/new' if @user.nil?
  @comment = Comment.find(params[:id])
  Vote.add_vote(@comment,-1,current_user)
  redirect back

  # erb :'comments/comment', locals: {comment: @comment}

end
get '/comments/:id/nullvote' do
  redirect '/sessions/new' if @user.nil?
  @comment = Comment.find(params[:id])
  Vote.add_vote(@comment,0,current_user)
  redirect back

  # erb :'comments/comment', locals: {comment: @comment}

end
post '/comments/:id/edit' do
  redirect '/sessions/new' if @user.nil?
  @comment=Comment.find(params[:id])
  redirect "/comments/#{params[:id]}" if @user!=@comment.author
  @comment.description = params[:comment_description]
  @comment.save
  erb :'comments/comment', locals: {comment: @comment}
end
get '/comments/:id/delete' do
  redirect '/sessions/new' if @user.nil?
  @comment = Comment.find(params[:id])
  redirect back if @user!=@comment.author
  @comment.delete

# NOTE: need to go back to invoking site.
  redirect back

end

