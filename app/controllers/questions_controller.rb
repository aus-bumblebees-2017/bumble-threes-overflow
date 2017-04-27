# List Questions
get '/questions' do
  "All questions"
end

# form for new Question
get '/questions/new' do
  erb :'questions/new'
end

# Create new Question
post '/questions' do
  @question = Question.create(params[:question])
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
  erb :'questions/question_view'
end

# Edit form for specific question
get '/questions/:id/edit' do
  "Edit question"
end

# Update Specific question
put '/questions/:id' do
  "Update question post"
end

# delete specific question
delete '/questions/:id' do
  "Delete question"
end
