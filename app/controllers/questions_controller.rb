# List Questions

# form for new Question

# Create new Question

# Show Specific Question
get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/question_view'
end

# Edit form for specific question


# Update Specific question

# delete specific question
