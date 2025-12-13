# Quiz Management Application

An interactive, full-featured quiz management system built with Ruby on Rails 8.1.1 and Tailwind CSS. This application allows administrators to create and manage quizzes with multiple question types, while providing an engaging quiz-taking experience for public users.

## 🎯 Features

### Admin Features
- **Secure Authentication**: Session-based login system for administrators
- **Quiz Management**: Full CRUD operations for quizzes
  - Create, edit, and delete quizzes
  - Publish/unpublish quizzes
  - Rich text descriptions
- **Question Builder**: Dynamic question creation with multiple types
  - Multiple Choice (single or multiple correct answers)
  - True/False questions
  - Matching questions
- **Dashboard**: Clean, intuitive interface to manage all quizzes
- **Real-time Preview**: View quiz details before publishing

### Public User Features
- **Browse Quizzes**: View all published quizzes
- **Interactive Quiz Taking**: Smooth, engaging quiz interface
  - One question at a time
  - Dynamic progress bar with percentage completion
  - Smooth transitions between questions
  - Prevent back navigation
- **Instant Results**: 
  - Overall score and percentage
  - Detailed answer review
  - Color-coded correct/incorrect answers
  - View correct answers after completion

### Technical Features
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile
- **Smooth Animations**: CSS transitions and Stimulus.js for interactivity
- **Session Tracking**: Anonymous quiz attempts tracked by session
- **Database Optimization**: Proper indexing and relationships
- **RESTful API Design**: Clean, maintainable code structure

## 🛠️ Tech Stack

- **Backend**: Ruby on Rails 8.1.1
- **Ruby Version**: 3.4.7
- **Database**: PostgreSQL
- **Frontend**: 
  - Tailwind CSS 4.1 for styling
  - Hotwire (Turbo & Stimulus.js) for interactivity
  - ERB templates
- **Authentication**: BCrypt with `has_secure_password`
- **Asset Pipeline**: Propshaft

## 📋 Prerequisites

- Ruby 3.4.7
- Rails 8.1.1
- PostgreSQL
- Node.js (for JavaScript dependencies)

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd quiz_mangement
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails db:seed
   ```

4. **Build Tailwind CSS**
   ```bash
   bin/rails tailwindcss:build
   ```

5. **Start the server**
   ```bash
   bin/rails server
   ```

6. **Visit the application**
   - Public interface: http://localhost:3000
   - Admin login: http://localhost:3000/login

## 👤 Default Admin Credentials

After running `db:seed`, you can log in with:
- **Email**: admin@example.com
- **Password**: password123

## 📁 Project Structure

```
app/
├── controllers/
│   ├── admin/                 # Admin-only controllers
│   │   ├── quizzes_controller.rb
│   │   └── questions_controller.rb
│   ├── quizzes_controller.rb   # Public quiz browsing
│   ├── quiz_attempts_controller.rb  # Quiz taking logic
│   └── sessions_controller.rb  # Authentication
├── models/
│   ├── user.rb                # Admin users
│   ├── quiz.rb                # Quiz management
│   ├── question.rb            # Questions with types
│   ├── option.rb              # Answer options
│   ├── quiz_attempt.rb        # User attempts
│   └── attempt_answer.rb      # Individual answers
├── views/
│   ├── admin/                 # Admin interface
│   ├── quizzes/               # Public quiz views
│   ├── quiz_attempts/         # Quiz taking interface
│   └── sessions/              # Login page
└── javascript/
    └── controllers/           # Stimulus controllers
        ├── question_form_controller.js
        ├── quiz_progress_controller.js
        ├── quiz_form_controller.js
        └── matching_controller.js
```

## 🎨 Design Highlights

### Color Scheme
- Primary: Indigo (600-700)
- Secondary: Purple (600-700)
- Success: Green (600)
- Error: Red (600)
- Background: Gradient from Purple-50 to Blue-50

### Animations
- Fade-in effects on page load
- Smooth progress bar transitions
- Hover effects on interactive elements
- Scale transforms on buttons
- Color transitions throughout

### User Experience
- Clear visual hierarchy
- Intuitive navigation
- Immediate feedback on actions
- Responsive layouts
- Accessible form controls

## 🔧 Configuration

### Database Configuration
Edit `config/database.yml` for your PostgreSQL setup.

### Environment Variables
For production, set:
- `SECRET_KEY_BASE`
- Database credentials
- Any API keys if needed

## 📊 Database Schema

### Core Tables
- `users`: Admin accounts
- `quizzes`: Quiz information and settings
- `questions`: Quiz questions with types
- `options`: Answer choices
- `quiz_attempts`: User quiz sessions
- `attempt_answers`: Individual question responses

### Key Relationships
- User → Quizzes (one-to-many)
- Quiz → Questions (one-to-many, ordered)
- Question → Options (one-to-many)
- QuizAttempt → AttemptAnswers (one-to-many)

## 🧪 Testing

Run tests with:
```bash
bin/rails test
```

## 📝 Development Notes

### Creating New Question Types
1. Add the type to Question model validation
2. Update the question form view
3. Add handling in QuizAttemptsController#answer
4. Update the results page display logic

### Customizing Styles
Edit `app/assets/tailwind/application.css` for custom CSS.

### Adding New Features
Follow Rails conventions:
- Controllers in `app/controllers`
- Models in `app/models`
- Views in `app/views`
- JavaScript in `app/javascript/controllers`

## 🚢 Deployment

### Production Setup
1. Set environment variables
2. Compile assets: `bin/rails assets:precompile`
3. Run migrations: `bin/rails db:migrate RAILS_ENV=production`
4. Use a production server (Puma, Passenger, etc.)

### Docker
A Dockerfile is included for containerized deployment.

## 📈 Future Enhancements

Potential features to add:
- [ ] Timer for quizzes
- [ ] Quiz categories/tags
- [ ] User registration for tracking history
- [ ] Quiz difficulty levels
- [ ] Question banks and random selection
- [ ] Image upload for questions
- [ ] Export results to CSV
- [ ] Quiz analytics and statistics
- [ ] Social sharing of results
- [ ] Leaderboards

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is open source and available under the MIT License.

## 👨‍💻 Author

Built with ❤️ using Ruby on Rails and Tailwind CSS

## 🐛 Bug Reports

Please report issues through the GitHub issue tracker.

## 💡 Support

For questions or support, please open an issue on GitHub.
