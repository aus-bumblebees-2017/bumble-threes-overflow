require 'faker'

users = []
15.times do

  username = Faker::Name.name
  email = username.downcase.delete(" ") + "@faker.com"
  password = SecureRandom.hex(10)

  users << User.create(username: username, email: email, hash_pw: password)
end


questions = []
30.times do

  author = users.sample
  title = Faker::Lorem.sentence.chop + "?"
  description = Faker::Lorem.paragraph

  questions << Question.create(title: title, description: description, author: author)
end

answers = []

50.times do
  author = users.sample
  question = questions.sample
  description = Faker::Lorem.paragraph

  answers << Answer.create(description: description, author: author, question: question)

end

my_comments = []

70.times do
  author = users.sample
  description = Faker::Lorem.paragraph
  vesels = questions + answers
  parent = vesels.sample
  comment = Comment.create(description: description, author: author)
  parent.comments << comment
  my_comments << comment
  parent.save
end

200.times do 
  author = users.sample
  vesels = questions+ answers + my_comments
  parent = vesels.sample

  parent.votes << Vote.create(author: author, weight: 1)
  parent.save
end















