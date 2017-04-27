# form for new answer
get '/questions/:question_id/answers/new' do
  "New answer"
end

# Create new Question
post '/questions/:question_id/answers' do
  erb :'answers/new'
end

# Show Specific Question
get '/questions/:question_id/answers/:id' do
  "Answers"
end

# Edit form for specific question
get '/questions/:question_id/answers/:id/edit' do
  "Edit Answer"
end

# Update Specific question
put '/questions/:question_id/answers/:id' do
  "Update Answer"
end

get '/questions/:question_id/answers/:id/delete' do
  "Delete Answer"
end

# delete specific question
delete '/questions/:question_id/answer/:id' do
  "Delete question"
end
