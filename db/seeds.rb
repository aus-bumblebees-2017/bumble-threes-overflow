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
  title = Faker::Lorem.sentence + "?"
  description = Faker::Lorem.paragraph

  questions << User.create(title: title, description: description, author: author)
end









