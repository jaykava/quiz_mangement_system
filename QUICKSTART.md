# 🚀 Quick Start Guide

## Get Started in 5 Minutes

### 1. Prerequisites Check
```bash
ruby -v   # Should be 3.4.7
rails -v  # Should be 8.1.1
psql --version  # PostgreSQL
```

### 2. Setup
```bash
# Clone and navigate to the project
cd quiz_mangement

# Install dependencies
bundle install

# Setup database
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed

# Build Tailwind CSS
bin/rails tailwindcss:build

# Start the server
bin/rails server
```

### 3. Access the Application

**Public Site**: http://localhost:3000
- Browse and take quizzes
- No login required

**Admin Panel**: http://localhost:3000/login
- **Email**: admin@example.com
- **Password**: password123

### 4. Try It Out!

#### As a Public User:
1. Visit http://localhost:3000
2. Click "Start Quiz" on any quiz
3. Answer the questions
4. See your results with correct answers highlighted

#### As an Admin:
1. Login at http://localhost:3000/login
2. View your dashboard
3. Create a new quiz
4. Add questions (try all 3 types!)
5. Publish your quiz
6. Test it on the public site

## 📱 Sample Data Included

After running `db:seed`, you'll have:
- ✅ 1 Admin user (admin@example.com)
- ✅ 3 Quizzes (2 published, 1 draft)
- ✅ 6 Questions with various types
- ✅ 19 Options/Answers

## 🎯 Key Features to Test

### Admin Features
- [ ] Create a quiz
- [ ] Add multiple choice question
- [ ] Add true/false question
- [ ] Add matching question
- [ ] Publish/unpublish toggle
- [ ] Edit quiz details
- [ ] Delete a quiz

### Public Features
- [ ] Browse quizzes
- [ ] Take a quiz
- [ ] Watch progress bar update
- [ ] Answer different question types
- [ ] View results page
- [ ] See correct answers highlighted

## 🎨 UI Highlights

- **Progress Bar**: Animated, shows percentage completion
- **Smooth Transitions**: Between questions and pages
- **Color-Coded Results**: Green for correct, red for incorrect
- **Responsive Design**: Works on mobile, tablet, desktop
- **Modern Gradients**: Purple/Indigo theme throughout

## 🛠️ Troubleshooting

### Server won't start?
```bash
# Remove stale PID
rm tmp/pids/server.pid
bin/rails server
```

### Styles not loading?
```bash
# Rebuild Tailwind
bin/rails tailwindcss:build
```

### Database issues?
```bash
# Reset database
bin/rails db:reset
```

## 📚 Project Structure

```
app/
├── controllers/
│   ├── admin/              # Admin-only features
│   ├── sessions_controller.rb
│   ├── quizzes_controller.rb
│   └── quiz_attempts_controller.rb
├── models/                 # 6 models
├── views/
│   ├── admin/             # Admin interface
│   ├── quizzes/           # Public quiz browsing
│   └── quiz_attempts/     # Quiz taking
└── javascript/
    └── controllers/       # Stimulus.js

db/
├── migrate/               # Database migrations
└── seeds.rb              # Sample data

config/
└── routes.rb             # RESTful routes
```

## 🎓 Learning Points

This project demonstrates:
- Rails 8.1 conventions
- Tailwind CSS integration
- Hotwire (Turbo + Stimulus)
- Session-based authentication
- Nested forms and associations
- Dynamic JavaScript with Stimulus
- Responsive design patterns
- RESTful API design

## 🚢 Ready for Production?

Before deploying:
1. Set environment variables
2. Configure production database
3. Precompile assets
4. Set up SSL
5. Configure email (if needed)

## 💬 Need Help?

- Check README.md for detailed documentation
- Check FEATURES.md for complete feature list
- Review the code comments
- Inspect the browser console for JS issues

## 🎉 Enjoy!

You now have a fully functional quiz management system. Feel free to:
- Customize the styling
- Add new features
- Extend question types
- Integrate with other services

Happy coding! 🚀
