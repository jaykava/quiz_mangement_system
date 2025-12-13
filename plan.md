Ruby on Rails + Tailwind CSS (monolithic)

1. Project goal

Build a fast, clean, quiz platform where:

- Admin can create and manage quizzes
- public users can take this quizzes without login
- mulitple quesion type are supported
- Smooth UI with good transitions and progress tracking
- users see the score and coorect answers after complete 

2. tech stack

- Backend: Ruby On Rails (version: 8.1.1) Ruby-3.4.7
- Frontend: Rails Views + Tailwind CSS
- database: postgresql
- Auth: sessio-based(admin only)
- interactivity: turbo, stimulus js

3. Core Features

- Admin Secure Login
- Create, edit, delete quizzes
- Add questions and answers
- support multiple questions types
- pulbish and unpublish by default it will unpublish
- publicview for publish quizzes
- Take the quiz without login anyone.
- Smooth quesition trnsitions
- Live progress bar
- after compltion score screen and correct answers

4. Data Models

- User(Admin)
  - name 
  - email
  - password_digest
  - role(admin)

- Quiz
  - title
  - description
  - published(boolean)
  - user_id

- Question
  - quiz_id
  - content
  - question_type
  - position

- Option
  - quesiton_id
  - content
  - correct(boolean)
  - match_key(for matching)

- QuizAttempt
  - quiz_id
  - seesion_id
  - score
  - total_questions

- AttemptAnswer
  - quesion_id
  - option_id
  - answer_text
  - correct

5. Question Type implemetion
  - Multiple ChoicOptions with one or more marked correct = true
  - True/ False two options only
  - Matching content = left item
  - match_key = coorect right item
  - User submits matched pairs

6. Authentication & Authorization
  - Admin AuthSession-base login
  - has_secure_password
  - protected /admin namespace
  beforo_action :require_login

  - public access no login required
  - track user via session_id

7. 
