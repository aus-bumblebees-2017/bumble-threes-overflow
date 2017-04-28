# form for new answer
get '/questions/:question_id/answers/new' do
  @question = Question.find_by(id: params[:question_id])
  erb :'answers/new'
end

# Create new Answer for question
post '/questions/:question_id/answers' do
  @question = Question.find_by(id: params[:question_id])
  #need to fix user

  @answer = Answer.create({description: params[:description], author: User.all.first})
  if @answer.valid?
    @question.answers << @answer
    @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :'answer/new'
  end
end

# Show Specific Question
get '/questions/:question_id/answers/:id' do
  "Answers"
end

# Edit form for specific question
get '/questions/:question_id/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:id])
  erb :'answers/edit'
end

# Update Specific question
put '/questions/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  @answer.description = params[:description]
  if @answer.save
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = @answers.errors.full_messages
    erb :'answers/new'
  end
end

get '/questions/:question_id/answers/:id/delete' do
  @answer = Answer.find_by(id: params[:id])
  @answer.destroy
  redirect "/questions/#{params[:question_id]}"
end

# delete specific question
delete '/questions/:question_id/answer/:id' do
  "Delete question"
end
