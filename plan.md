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
  - points

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

7. quiz flow (public)
  - quiz start
  - quizattempt ccreted
  - questions show one by one
  - turbo transitions beetwen questions
  - progress bar updates dyammically
  - anser stored per question
  - quiz completed
  - score calclated
  - display results page

8. Scoring Logic
  - each quesion has points
  - correct answers add points
  - scores saved in quiz_attempts
  - correct anser displayed after completion

9. UI / UX 
  - Quiz UI one quesion per screen
  - smooth transitions
  - disable back navigation
  - sticky progress bar
  - results pagetotalscore
  - correct/incoreect breakdown
  - highlight correct answers

10 Admin UI
  - Dashnboard with quizzes list
  - Quiz editor
  - Dynamic Question builder
  - Option add/remove
  - Publish toggle

11 Stimulus controller
  - quiz_controller.js
  - progress_controller.js
  - matching_controller.js

12 Validtion Rules
  - Quiz must have 1 question
  - question must have valid options
  - matching questions require match_key
  - Admin-only create quiz
  - deletion of the quiz have dependent destroy

13 Milestones
  1. project setup and all dependency css and all
  2. Database models
  3. Admin authentication
  4. Quiz CRUD
  5. Quesion Builder
  6. public quiz flow
  7. scorinf & results
  8. UI polish
  9. testing


