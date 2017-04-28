before '/questions*' do
  current_user
end

# List Questions
get '/questions' do
  @questions = Question.all
  @total_questions = Question.all.count
  erb :'questions/index'
end

# form for new Question
get '/questions/new' do
  redirect '/sessions/new' if @user.nil?
  erb :'questions/new'
end

# Create new Question
post '/questions' do
  redirect '/sessions/new' if  @user.nil?
  quest = params[:question]
  quest[:author] = @user # this will need to be set by session
  @question = Question.create(quest)
  if @question.valid?
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

# Show Specific Question
get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/show'
end

# Edit form for specific question
get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/edit'
end

# Update Specific question
put '/questions/:id' do
  redirect '/sessions/new' if @user.nil?
  @question = Question.find_by(id: params[:id])
  @question.update(params[:question])
  if @question.valid?
    redirect "/questions/#{params[:id]}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/edit'
  end
end

get '/questions/:id/delete' do
  redirect '/sessions/new' if @user.nil?
  @question = Question.find_by(id: params[:id])
  @question.destroy
  redirect '/questions'
end

# delete specific question
delete '/questions/:id' do
  "Delete question"
end

get '/questions/:id/vote/:weight' do
  @question = Question.find_by(id: params[:id])
  Vote.add_vote(@question, params[:weight], current_user)
  redirect "/questions/#{params[:id]}"
end

# FOR TESTING
get '/' do
  erb :'ben_test'
end
