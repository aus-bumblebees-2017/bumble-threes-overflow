# Bumble-Threes
## Team Members:
Juan, Karina, and Ben

## User Stories

### USERS
1. As a user, I can register
** create User Model
*** encrypt password
** New User View
** User Profile view (user home page)
** User Controller
*** GET - /users/:id
*** GET - /users/new
*** POST - /users

4. As a user, I can delete my account -> need to decide what happens to users "stuff"
** User Controller
*** DELETE (POST) - /users/:id

### USER & SESSION
2. As a user, I can login
** login view
** session controller
*** GET /sessions/login - view
*** POST /sessions - action

3. As a user, I can logout
** session controller
*** POST /sessions/:id/logout

### QUESTIONS
5. As a user, I can post a question
** question model
** question views
*** question create form
*** all questions home
*** individual question home
** question controller
*** Create - /questions/new

6. As a user, I can post an answer
** answer model
** answer view (partial used by question view)
*** display view
*** create view
** answer controller
*** Create questions/:id/answer/new

7. As a user, I can comment on questions and answers
** comment model
** comment view (partial used by question & answer views)
*** display view
*** create view
** comment controller
*** create comment questions/:id/comment/new and questions/:id/answers/:id/new

### VOTES
8. As a user, I can upvote or downvote on questions, answers, and comments once.
** vote model
** (might need partial view)
** vote controller
*** up vote
*** down vote

9. As a user, I can change my votes.
** vote controller
*** set vote to 0 (or maybe delete?)

### AUTHOR
10. As a question author, I can select the best answer to my question
** question controller
*** mark answer "best"

11. As an author, I can edit my questions, answers and comments.
** question controller
*** Update question
*** Delete question
** answer controller
*** update answer
*** delete answer
** comment controller
*** update comment
*** delete comment

### ALL
12. As an anonymous user, I can view/read questions, answers and comments, but I cannot add questions, answers, comments, or vote.
** All controllers -> not authorized - send to login with message

### OTHER TASKS
layout.erb
css
index/home page
tests?
