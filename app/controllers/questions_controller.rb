# List Questions
get '/questions' do
  @questions = Question.all
  @total_questions = Question.all.count
  erb :'questions/index'
end

# form for new Question
get '/questions/new' do
  erb :'questions/new'
end

# Create new Question
post '/questions' do
  quest = params[:question]
  quest[:author] = User.find_by(id: 1) # this will need to be set by session
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
  erb :'questions/view'
end

# Edit form for specific question
get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/edit'
end

# Update Specific question
put '/questions/:id' do
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
  @question = Question.find_by(id: params[:id])
  @question.destroy
  redirect '/questions'
end

# delete specific question
delete '/questions/:id' do
  "Delete question"
end


# FOR TESTING
get '/' do
  erb :'ben_test'
end
