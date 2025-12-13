# Clear existing data
puts "Clearing existing data..."
AttemptAnswer.destroy_all
QuizAttempt.destroy_all
Option.destroy_all
Question.destroy_all
Quiz.destroy_all
User.destroy_all

# ========================================
# Create Single Admin User
# ========================================
puts "\n👤 Creating admin user..."
admin = User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: "admin"
)
puts "✓ Admin created: #{admin.email} / password123"

# ========================================
# Quiz 1: Comprehensive General Knowledge Quiz (Published)
# ========================================
puts "\n📝 Creating Quiz 1: Comprehensive General Knowledge..."
quiz1 = admin.quizzes.create!(
  title: "Comprehensive General Knowledge Quiz",
  description: "Test your general knowledge across various topics including geography, culture, and common facts. This quiz covers all question types!",
  published: true
)

# Multiple Choice Questions
q1_1 = quiz1.questions.create!(
  content: "What is the capital of France?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q1_1.options.create!([
  { content: "London", correct: false },
  { content: "Paris", correct: true },
  { content: "Berlin", correct: false },
  { content: "Madrid", correct: false }
])

q1_2 = quiz1.questions.create!(
  content: "Which planet is known as the Red Planet?",
  question_type: "multiple_choice",
  position: 2,
  points: 10
)
q1_2.options.create!([
  { content: "Venus", correct: false },
  { content: "Mars", correct: true },
  { content: "Jupiter", correct: false },
  { content: "Saturn", correct: false }
])

q1_3 = quiz1.questions.create!(
  content: "Who painted the Mona Lisa?",
  question_type: "multiple_choice",
  position: 3,
  points: 15
)
q1_3.options.create!([
  { content: "Vincent van Gogh", correct: false },
  { content: "Pablo Picasso", correct: false },
  { content: "Leonardo da Vinci", correct: true },
  { content: "Michelangelo", correct: false }
])

q1_4 = quiz1.questions.create!(
  content: "What is the largest ocean on Earth?",
  question_type: "multiple_choice",
  position: 4,
  points: 10
)
q1_4.options.create!([
  { content: "Atlantic Ocean", correct: false },
  { content: "Indian Ocean", correct: false },
  { content: "Pacific Ocean", correct: true },
  { content: "Arctic Ocean", correct: false }
])

# True/False Questions
q1_5 = quiz1.questions.create!(
  content: "The Great Wall of China is visible from space with the naked eye.",
  question_type: "true_false",
  position: 5,
  points: 5
)
q1_5.options.create!([
  { content: "True", correct: false },
  { content: "False", correct: true }
])

q1_6 = quiz1.questions.create!(
  content: "Mount Everest is the tallest mountain in the world.",
  question_type: "true_false",
  position: 6,
  points: 5
)
q1_6.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q1_7 = quiz1.questions.create!(
  content: "Humans have 5 senses.",
  question_type: "true_false",
  position: 7,
  points: 5
)
q1_7.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

# Matching Questions
q1_8 = quiz1.questions.create!(
  content: "Match the countries with their capitals:",
  question_type: "matching",
  position: 8,
  points: 20
)
q1_8.options.create!([
  { content: "Japan", match_key: "Tokyo", correct: true },
  { content: "Italy", match_key: "Rome", correct: true },
  { content: "Canada", match_key: "Ottawa", correct: true },
  { content: "Australia", match_key: "Canberra", correct: true },
  { content: "Brazil", match_key: "Brasília", correct: true }
])

q1_9 = quiz1.questions.create!(
  content: "Match the programming languages with their primary use:",
  question_type: "matching",
  position: 9,
  points: 15
)
q1_9.options.create!([
  { content: "Python", match_key: "Data Science & AI", correct: true },
  { content: "JavaScript", match_key: "Web Development", correct: true },
  { content: "SQL", match_key: "Database Management", correct: true },
  { content: "Swift", match_key: "iOS Development", correct: true }
])

# ========================================
# Quiz 2: Advanced Science & Technology (Published)
# ========================================
puts "📝 Creating Quiz 2: Advanced Science & Technology..."
quiz2 = admin.quizzes.create!(
  title: "Advanced Science & Technology Quiz",
  description: "Challenge yourself with advanced questions in physics, chemistry, biology, and computer science.",
  published: true
)

q2_1 = quiz2.questions.create!(
  content: "What is the chemical symbol for Gold?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q2_1.options.create!([
  { content: "Go", correct: false },
  { content: "Gd", correct: false },
  { content: "Au", correct: true },
  { content: "Ag", correct: false }
])

q2_2 = quiz2.questions.create!(
  content: "What is the speed of light in a vacuum?",
  question_type: "multiple_choice",
  position: 2,
  points: 15
)
q2_2.options.create!([
  { content: "300,000 km/s", correct: true },
  { content: "150,000 km/s", correct: false },
  { content: "450,000 km/s", correct: false },
  { content: "200,000 km/s", correct: false }
])

q2_3 = quiz2.questions.create!(
  content: "What is the powerhouse of the cell?",
  question_type: "multiple_choice",
  position: 3,
  points: 10
)
q2_3.options.create!([
  { content: "Nucleus", correct: false },
  { content: "Mitochondria", correct: true },
  { content: "Ribosome", correct: false },
  { content: "Chloroplast", correct: false }
])

q2_4 = quiz2.questions.create!(
  content: "Which element has the atomic number 1?",
  question_type: "multiple_choice",
  position: 4,
  points: 10
)
q2_4.options.create!([
  { content: "Helium", correct: false },
  { content: "Hydrogen", correct: true },
  { content: "Oxygen", correct: false },
  { content: "Carbon", correct: false }
])

q2_5 = quiz2.questions.create!(
  content: "DNA stands for Deoxyribonucleic Acid.",
  question_type: "true_false",
  position: 5,
  points: 5
)
q2_5.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q2_6 = quiz2.questions.create!(
  content: "The human body has 206 bones.",
  question_type: "true_false",
  position: 6,
  points: 5
)
q2_6.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q2_7 = quiz2.questions.create!(
  content: "Sound travels faster in water than in air.",
  question_type: "true_false",
  position: 7,
  points: 5
)
q2_7.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q2_8 = quiz2.questions.create!(
  content: "Match the scientists with their discoveries:",
  question_type: "matching",
  position: 8,
  points: 25
)
q2_8.options.create!([
  { content: "Isaac Newton", match_key: "Laws of Motion", correct: true },
  { content: "Albert Einstein", match_key: "Theory of Relativity", correct: true },
  { content: "Marie Curie", match_key: "Radioactivity", correct: true },
  { content: "Charles Darwin", match_key: "Theory of Evolution", correct: true },
  { content: "Nikola Tesla", match_key: "Alternating Current", correct: true }
])

# ========================================
# Quiz 3: World History & Culture (Published)
# ========================================
puts "📝 Creating Quiz 3: World History & Culture..."
quiz3 = admin.quizzes.create!(
  title: "World History & Culture Quiz",
  description: "Journey through time and explore significant historical events and cultural milestones.",
  published: true
)

q3_1 = quiz3.questions.create!(
  content: "In which year did World War II end?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q3_1.options.create!([
  { content: "1943", correct: false },
  { content: "1944", correct: false },
  { content: "1945", correct: true },
  { content: "1946", correct: false }
])

q3_2 = quiz3.questions.create!(
  content: "Who was the first President of the United States?",
  question_type: "multiple_choice",
  position: 2,
  points: 10
)
q3_2.options.create!([
  { content: "Thomas Jefferson", correct: false },
  { content: "George Washington", correct: true },
  { content: "John Adams", correct: false },
  { content: "Benjamin Franklin", correct: false }
])

q3_3 = quiz3.questions.create!(
  content: "Which ancient wonder is still standing today?",
  question_type: "multiple_choice",
  position: 3,
  points: 15
)
q3_3.options.create!([
  { content: "Hanging Gardens of Babylon", correct: false },
  { content: "Great Pyramid of Giza", correct: true },
  { content: "Colossus of Rhodes", correct: false },
  { content: "Lighthouse of Alexandria", correct: false }
])

q3_4 = quiz3.questions.create!(
  content: "The Renaissance began in Italy.",
  question_type: "true_false",
  position: 4,
  points: 5
)
q3_4.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q3_5 = quiz3.questions.create!(
  content: "The Berlin Wall fell in 1989.",
  question_type: "true_false",
  position: 5,
  points: 5
)
q3_5.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q3_6 = quiz3.questions.create!(
  content: "Match the historical figures with their roles:",
  question_type: "matching",
  position: 6,
  points: 20
)
q3_6.options.create!([
  { content: "Julius Caesar", match_key: "Roman Emperor", correct: true },
  { content: "Cleopatra", match_key: "Egyptian Pharaoh", correct: true },
  { content: "Napoleon Bonaparte", match_key: "French Military Leader", correct: true },
  { content: "Genghis Khan", match_key: "Mongol Emperor", correct: true }
])

# ========================================
# Quiz 4: Mathematics & Logic (Published)
# ========================================
puts "📝 Creating Quiz 4: Mathematics & Logic..."
quiz4 = admin.quizzes.create!(
  title: "Mathematics & Logic Challenge",
  description: "Test your mathematical reasoning and logical thinking abilities with these brain teasers.",
  published: true
)

q4_1 = quiz4.questions.create!(
  content: "What is the square root of 144?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q4_1.options.create!([
  { content: "10", correct: false },
  { content: "11", correct: false },
  { content: "12", correct: true },
  { content: "13", correct: false }
])

q4_2 = quiz4.questions.create!(
  content: "What is the value of π (pi) approximately?",
  question_type: "multiple_choice",
  position: 2,
  points: 10
)
q4_2.options.create!([
  { content: "2.14", correct: false },
  { content: "3.14", correct: true },
  { content: "4.14", correct: false },
  { content: "3.41", correct: false }
])

q4_3 = quiz4.questions.create!(
  content: "What is 25% of 200?",
  question_type: "multiple_choice",
  position: 3,
  points: 10
)
q4_3.options.create!([
  { content: "25", correct: false },
  { content: "50", correct: true },
  { content: "75", correct: false },
  { content: "100", correct: false }
])

q4_4 = quiz4.questions.create!(
  content: "A prime number is only divisible by 1 and itself.",
  question_type: "true_false",
  position: 4,
  points: 5
)
q4_4.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q4_5 = quiz4.questions.create!(
  content: "The sum of angles in a triangle is 180 degrees.",
  question_type: "true_false",
  position: 5,
  points: 5
)
q4_5.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q4_6 = quiz4.questions.create!(
  content: "Match the mathematical operations with their symbols:",
  question_type: "matching",
  position: 6,
  points: 15
)
q4_6.options.create!([
  { content: "Addition", match_key: "+", correct: true },
  { content: "Subtraction", match_key: "-", correct: true },
  { content: "Multiplication", match_key: "×", correct: true },
  { content: "Division", match_key: "÷", correct: true }
])

# ========================================
# Quiz 5: Literature & Arts (Published)
# ========================================
puts "📝 Creating Quiz 5: Literature & Arts..."
quiz5 = admin.quizzes.create!(
  title: "Literature & Arts Quiz",
  description: "Explore the world of literature, music, and visual arts with these questions.",
  published: true
)

q5_1 = quiz5.questions.create!(
  content: "Who wrote 'Romeo and Juliet'?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q5_1.options.create!([
  { content: "Charles Dickens", correct: false },
  { content: "William Shakespeare", correct: true },
  { content: "Jane Austen", correct: false },
  { content: "Mark Twain", correct: false }
])

q5_2 = quiz5.questions.create!(
  content: "Who composed 'The Four Seasons'?",
  question_type: "multiple_choice",
  position: 2,
  points: 10
)
q5_2.options.create!([
  { content: "Mozart", correct: false },
  { content: "Vivaldi", correct: true },
  { content: "Beethoven", correct: false },
  { content: "Bach", correct: false }
])

q5_3 = quiz5.questions.create!(
  content: "'To be or not to be' is a famous line from Hamlet.",
  question_type: "true_false",
  position: 3,
  points: 5
)
q5_3.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q5_4 = quiz5.questions.create!(
  content: "Match the authors with their famous works:",
  question_type: "matching",
  position: 4,
  points: 20
)
q5_4.options.create!([
  { content: "J.K. Rowling", match_key: "Harry Potter", correct: true },
  { content: "George Orwell", match_key: "1984", correct: true },
  { content: "J.R.R. Tolkien", match_key: "The Lord of the Rings", correct: true },
  { content: "Harper Lee", match_key: "To Kill a Mockingbird", correct: true }
])

# ========================================
# Quiz 6: Geography & Nature (Published)
# ========================================
puts "📝 Creating Quiz 6: Geography & Nature..."
quiz6 = admin.quizzes.create!(
  title: "Geography & Nature Quiz",
  description: "Test your knowledge about countries, continents, and the natural world.",
  published: true
)

q6_1 = quiz6.questions.create!(
  content: "What is the smallest country in the world?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q6_1.options.create!([
  { content: "Monaco", correct: false },
  { content: "Vatican City", correct: true },
  { content: "San Marino", correct: false },
  { content: "Liechtenstein", correct: false }
])

q6_2 = quiz6.questions.create!(
  content: "Which river is the longest in the world?",
  question_type: "multiple_choice",
  position: 2,
  points: 10
)
q6_2.options.create!([
  { content: "Amazon River", correct: false },
  { content: "Nile River", correct: true },
  { content: "Yangtze River", correct: false },
  { content: "Mississippi River", correct: false }
])

q6_3 = quiz6.questions.create!(
  content: "The Sahara is the largest hot desert in the world.",
  question_type: "true_false",
  position: 3,
  points: 5
)
q6_3.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q6_4 = quiz6.questions.create!(
  content: "Match the landmarks with their countries:",
  question_type: "matching",
  position: 4,
  points: 20
)
q6_4.options.create!([
  { content: "Eiffel Tower", match_key: "France", correct: true },
  { content: "Taj Mahal", match_key: "India", correct: true },
  { content: "Statue of Liberty", match_key: "USA", correct: true },
  { content: "Big Ben", match_key: "England", correct: true }
])

# ========================================
# Quiz 7: Sports & Entertainment (Published)
# ========================================
puts "📝 Creating Quiz 7: Sports & Entertainment..."
quiz7 = admin.quizzes.create!(
  title: "Sports & Entertainment Quiz",
  description: "How well do you know sports and entertainment? Find out with this quiz!",
  published: true
)

q7_1 = quiz7.questions.create!(
  content: "How many players are on a soccer team?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q7_1.options.create!([
  { content: "9", correct: false },
  { content: "10", correct: false },
  { content: "11", correct: true },
  { content: "12", correct: false }
])

q7_2 = quiz7.questions.create!(
  content: "Which country hosted the 2016 Summer Olympics?",
  question_type: "multiple_choice",
  position: 2,
  points: 10
)
q7_2.options.create!([
  { content: "China", correct: false },
  { content: "Brazil", correct: true },
  { content: "England", correct: false },
  { content: "Japan", correct: false }
])

q7_3 = quiz7.questions.create!(
  content: "Basketball was invented in the United States.",
  question_type: "true_false",
  position: 3,
  points: 5
)
q7_3.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q7_4 = quiz7.questions.create!(
  content: "Match the sports with their playing surfaces:",
  question_type: "matching",
  position: 4,
  points: 15
)
q7_4.options.create!([
  { content: "Tennis", match_key: "Court", correct: true },
  { content: "Soccer", match_key: "Field", correct: true },
  { content: "Ice Hockey", match_key: "Rink", correct: true },
  { content: "Swimming", match_key: "Pool", correct: true }
])

# ========================================
# Quiz 8: Technology & Computing (Published)
# ========================================
puts "📝 Creating Quiz 8: Technology & Computing..."
quiz8 = admin.quizzes.create!(
  title: "Technology & Computing Quiz",
  description: "Test your knowledge of computers, internet, and modern technology.",
  published: true
)

q8_1 = quiz8.questions.create!(
  content: "What does CPU stand for?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q8_1.options.create!([
  { content: "Central Process Unit", correct: false },
  { content: "Central Processing Unit", correct: true },
  { content: "Computer Personal Unit", correct: false },
  { content: "Central Processor Unit", correct: false }
])

q8_2 = quiz8.questions.create!(
  content: "Who is the founder of Microsoft?",
  question_type: "multiple_choice",
  position: 2,
  points: 10
)
q8_2.options.create!([
  { content: "Steve Jobs", correct: false },
  { content: "Bill Gates", correct: true },
  { content: "Mark Zuckerberg", correct: false },
  { content: "Elon Musk", correct: false }
])

q8_3 = quiz8.questions.create!(
  content: "HTML stands for HyperText Markup Language.",
  question_type: "true_false",
  position: 3,
  points: 5
)
q8_3.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q8_4 = quiz8.questions.create!(
  content: "Match the file extensions with their types:",
  question_type: "matching",
  position: 4,
  points: 15
)
q8_4.options.create!([
  { content: ".jpg", match_key: "Image", correct: true },
  { content: ".mp3", match_key: "Audio", correct: true },
  { content: ".pdf", match_key: "Document", correct: true },
  { content: ".mp4", match_key: "Video", correct: true }
])

# ========================================
# Quiz 9: Food & Cuisine (Published)
# ========================================
puts "📝 Creating Quiz 9: Food & Cuisine..."
quiz9 = admin.quizzes.create!(
  title: "Food & Cuisine Quiz",
  description: "A delicious journey through world cuisines and culinary knowledge.",
  published: true
)

q9_1 = quiz9.questions.create!(
  content: "What is the main ingredient in guacamole?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q9_1.options.create!([
  { content: "Tomato", correct: false },
  { content: "Avocado", correct: true },
  { content: "Pepper", correct: false },
  { content: "Onion", correct: false }
])

q9_2 = quiz9.questions.create!(
  content: "Which country is famous for sushi?",
  question_type: "multiple_choice",
  position: 2,
  points: 10
)
q9_2.options.create!([
  { content: "China", correct: false },
  { content: "Japan", correct: true },
  { content: "Korea", correct: false },
  { content: "Thailand", correct: false }
])

q9_3 = quiz9.questions.create!(
  content: "Pizza originated in Italy.",
  question_type: "true_false",
  position: 3,
  points: 5
)
q9_3.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

q9_4 = quiz9.questions.create!(
  content: "Match the dishes with their countries of origin:",
  question_type: "matching",
  position: 4,
  points: 20
)
q9_4.options.create!([
  { content: "Tacos", match_key: "Mexico", correct: true },
  { content: "Croissant", match_key: "France", correct: true },
  { content: "Pasta", match_key: "Italy", correct: true },
  { content: "Curry", match_key: "India", correct: true }
])

# ========================================
# Quiz 10: Mixed Topics Challenge (Published)
# ========================================
puts "📝 Creating Quiz 10: Ultimate Mixed Knowledge..."
quiz10 = admin.quizzes.create!(
  title: "Ultimate Mixed Knowledge Challenge",
  description: "The ultimate test covering all topics. This comprehensive quiz has 20 questions!",
  published: true
)

# Add 20 diverse questions
20.times do |i|
  case i % 3
  when 0 # Multiple choice
    q = quiz10.questions.create!(
      content: "Question #{i + 1}: What is the correct answer for this challenging question?",
      question_type: "multiple_choice",
      position: i + 1,
      points: 10
    )
    q.options.create!([
      { content: "Option A", correct: i % 4 == 0 },
      { content: "Option B", correct: i % 4 == 1 },
      { content: "Option C", correct: i % 4 == 2 },
      { content: "Option D", correct: i % 4 == 3 }
    ])
  when 1 # True/False
    q = quiz10.questions.create!(
      content: "Question #{i + 1}: This statement about general knowledge is #{i.even? ? 'true' : 'false'}.",
      question_type: "true_false",
      position: i + 1,
      points: 5
    )
    q.options.create!([
      { content: "True", correct: i.even? },
      { content: "False", correct: i.odd? }
    ])
  when 2 # Matching
    q = quiz10.questions.create!(
      content: "Question #{i + 1}: Match the following items correctly:",
      question_type: "matching",
      position: i + 1,
      points: 15
    )
    q.options.create!([
      { content: "Item 1", match_key: "Match A", correct: true },
      { content: "Item 2", match_key: "Match B", correct: true },
      { content: "Item 3", match_key: "Match C", correct: true }
    ])
  end
end

# ========================================
# Quiz 11: Empty Quiz (Published - Edge Case)
# ========================================
puts "📝 Creating Quiz 11: Coming Soon Quiz (Edge Case)..."
quiz11 = admin.quizzes.create!(
  title: "Coming Soon Quiz",
  description: "This quiz is under construction. Questions will be added soon!",
  published: true
)
# No questions added - edge case for empty quiz

# ========================================
# Quiz 12: Single Question Quiz (Published - Edge Case)
# ========================================
puts "📝 Creating Quiz 12: Quick Question (Edge Case)..."
quiz12 = admin.quizzes.create!(
  title: "Quick Question",
  description: "Just one quick question to test your knowledge!",
  published: true
)

q12_1 = quiz12.questions.create!(
  content: "Is Ruby a programming language?",
  question_type: "true_false",
  position: 1,
  points: 100
)
q12_1.options.create!([
  { content: "True", correct: true },
  { content: "False", correct: false }
])

# ========================================
# Quiz 13-15: Draft Quizzes (Unpublished)
# ========================================
puts "📝 Creating Draft Quizzes..."

quiz13 = admin.quizzes.create!(
  title: "Astronomy Quiz (Draft)",
  description: "A quiz about stars, planets, and the universe - coming soon!",
  published: false
)
q13_1 = quiz13.questions.create!(
  content: "How many planets are in our solar system?",
  question_type: "multiple_choice",
  position: 1,
  points: 10
)
q13_1.options.create!([
  { content: "7", correct: false },
  { content: "8", correct: true },
  { content: "9", correct: false },
  { content: "10", correct: false }
])

quiz14 = admin.quizzes.create!(
  title: "Ancient Civilizations (Draft)",
  description: "Explore ancient empires and civilizations - in development.",
  published: false
)

quiz15 = admin.quizzes.create!(
  title: "Modern Art (Draft)",
  description: "A journey through modern art movements - work in progress.",
  published: false
)

# ========================================
# Summary
# ========================================
puts "\n" + "="*60
puts "✅ Seeding completed successfully!"
puts "="*60
puts "\n📊 DATABASE SUMMARY:"
puts "  Users:           #{User.count} (#{User.where(role: 'admin').count} admin)"
puts "  Quizzes:         #{Quiz.count} (#{Quiz.where(published: true).count} published, #{Quiz.where(published: false).count} draft)"
puts "  Questions:       #{Question.count}"
puts "    - Multiple Choice: #{Question.where(question_type: 'multiple_choice').count}"
puts "    - True/False:      #{Question.where(question_type: 'true_false').count}"
puts "    - Matching:        #{Question.where(question_type: 'matching').count}"
puts "  Options:         #{Option.count}"

puts "\n👤 LOGIN CREDENTIALS:"
puts "  Admin: admin@example.com / password123"

puts "\n📝 QUIZ DETAILS:"
Quiz.order(:id).each do |quiz|
  status = quiz.published? ? "✓ Published" : "✗ Draft"
  puts "  #{quiz.id}. #{quiz.title} (#{status}) - #{quiz.questions.count} questions"
end

puts "\n🎯 HIGHLIGHTS:"
puts "  ✓ 1 admin user with comprehensive access"
puts "  ✓ 15 quizzes created by the admin (12 published, 3 draft)"
puts "  ✓ All question types covered (multiple_choice, true_false, matching)"
puts "  ✓ Various quiz topics (Science, History, Math, Arts, Sports, etc.)"
puts "  ✓ Various quiz sizes (empty, single question, large 20+ questions)"
puts "  ✓ Edge cases included for testing"
puts "="*60
