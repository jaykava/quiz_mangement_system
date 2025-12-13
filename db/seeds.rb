# Create admin user
puts "Creating admin user..."
admin = User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: "admin"
)
puts "Admin created: #{admin.email} / password123"

# Create sample quizzes
puts "\nCreating sample quizzes..."

# Quiz 1: General Knowledge
quiz1 = admin.quizzes.create!(
  title: "General Knowledge Quiz",
  description: "Test your general knowledge with this fun quiz!",
  published: true
)

# Question 1: Multiple Choice
q1 = quiz1.questions.create!(
  content: "What is the capital of France?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q1.options.create!([
  { content: "London", correct: false },
  { content: "Paris", correct: true },
  { content: "Berlin", correct: false },
  { content: "Madrid", correct: false }
])

# Question 2: True/False
q2 = quiz1.questions.create!(
  content: "The Earth is flat.",
  question_type: "true_false",
  position: 2,
  points: 5
)
q2.options.create!([
  { content: "True", correct: false },
  { content: "False", correct: true }
])

# Question 3: Matching
q3 = quiz1.questions.create!(
  content: "Match the countries with their capitals:",
  question_type: "matching",
  position: 3,
  points: 15
)
q3.options.create!([
  { content: "Japan", match_key: "Tokyo", correct: true },
  { content: "Italy", match_key: "Rome", correct: true },
  { content: "Canada", match_key: "Ottawa", correct: true }
])

# Quiz 2: Science Quiz
quiz2 = admin.quizzes.create!(
  title: "Science Quiz",
  description: "Challenge yourself with these science questions!",
  published: true
)

# Question 1
q4 = quiz2.questions.create!(
  content: "What is the chemical symbol for water?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q4.options.create!([
  { content: "H2O", correct: true },
  { content: "CO2", correct: false },
  { content: "O2", correct: false },
  { content: "N2", correct: false }
])

# Question 2
q5 = quiz2.questions.create!(
  content: "The sun is a star.",
  question_type: "true_false",
  position: 2,
  points: 5
)
q5.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

# Quiz 3: Unpublished Draft
quiz3 = admin.quizzes.create!(
  title: "History Quiz (Draft)",
  description: "A quiz about historical events - coming soon!",
  published: false
)

q6 = quiz3.questions.create!(
  content: "In which year did World War II end?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q6.options.create!([
  { content: "1943", correct: false },
  { content: "1944", correct: false },
  { content: "1945", correct: true },
  { content: "1946", correct: false }
])

puts "\nSeeding completed!"
puts "Created:"
puts "- 1 admin user"
puts "- #{Quiz.count} quizzes (#{Quiz.published.count} published)"
puts "- #{Question.count} questions"
puts "- #{Option.count} options"
puts "\nYou can login with:"
puts "Email: admin@example.com"
puts "Password: password123"
