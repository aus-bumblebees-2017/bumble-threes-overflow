get '/comments' do
  @comments = Comment.all

  erb :'comments/index'
end
get '/comments/new' do

  erb :'comments/new'
end
post '/comments/new' do
  @comment=Comment.create(description: params[:comment_description])


  erb :"comments/comment", locals: {comment: @comment}
end
get '/comments/:id' do
  @comment = Comment.find(params[:id])

  erb :'comments/comment'

end
get '/comments/:id/edit' do
  @comment = Comment.find(params[:id])

  erb :'comments/edit'

end
post '/comments/:id/edit' do
  @comment=Comment.find(params[:id])
  @comment.description = params[:comment_description]
  @comment.save
  binding.pry
  erb :'comments/comment', locals: {comment: @comment}
end
get '/comments/:id/delete' do
  @comment = Comment.find(params[:id]).delete

# NOTE: need to go back to invoking site.
  redirect '/comments'

end

