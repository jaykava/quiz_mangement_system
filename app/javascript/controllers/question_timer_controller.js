import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="question-timer"
export default class extends Controller {
  static targets = ["display", "form", "progressRing", "secondsText"]
  static values = {
    duration: { type: Number, default: 10 },
    autoSubmit: { type: Boolean, default: true },
    nextUrl: String,
    isLastQuestion: { type: Boolean, default: false },
    questionId: String,
    attemptId: String
  }

  connect() {
    // Generate a unique key for this question's timer
    this.storageKey = `timer_${this.attemptIdValue}_${this.questionIdValue}`
    
    // Check if we have a saved timer state
    const savedTime = this.getSavedTime()
    
    if (savedTime !== null && savedTime > 0) {
      // Resume from saved time
      this.timeRemaining = savedTime
    } else if (savedTime === 0) {
      // Time already expired, trigger timeout immediately
      this.timeRemaining = 0
      this.updateDisplay()
      this.handleTimeout()
      return
    } else {
      // Fresh start
      this.timeRemaining = this.durationValue
      this.saveTime()
    }
    
    this.startTimer()
    this.updateDisplay()
    
    // Listen for successful navigation to clear saved timer
    this.boundClearOnSuccess = this.clearOnSuccessfulNavigation.bind(this)
    document.addEventListener("turbo:before-visit", this.boundClearOnSuccess)
  }

  disconnect() {
    this.stopTimer()
    // Remove event listener
    if (this.boundClearOnSuccess) {
      document.removeEventListener("turbo:before-visit", this.boundClearOnSuccess)
    }
    // Save current time when disconnecting (e.g., validation error re-render)
    if (this.timeRemaining > 0) {
      this.saveTime()
    }
  }

  clearOnSuccessfulNavigation(event) {
    // Clear saved timer when navigating away successfully (not on form re-render)
    this.clearSavedTime()
  }

  getSavedTime() {
    const saved = sessionStorage.getItem(this.storageKey)
    return saved !== null ? parseInt(saved, 10) : null
  }

  saveTime() {
    sessionStorage.setItem(this.storageKey, this.timeRemaining.toString())
  }

  clearSavedTime() {
    sessionStorage.removeItem(this.storageKey)
  }

  startTimer() {
    this.timerInterval = setInterval(() => {
      this.timeRemaining -= 1
      this.saveTime()
      this.updateDisplay()

      if (this.timeRemaining <= 0) {
        this.stopTimer()
        this.clearSavedTime()
        this.handleTimeout()
      }
    }, 1000)
  }

  stopTimer() {
    if (this.timerInterval) {
      clearInterval(this.timerInterval)
      this.timerInterval = null
    }
  }

  updateDisplay() {
    // Update seconds text
    if (this.hasSecondsTextTarget) {
      this.secondsTextTarget.textContent = this.timeRemaining
    }

    // Update progress ring
    if (this.hasProgressRingTarget) {
      const circumference = 2 * Math.PI * 45 // radius is 45
      const offset = circumference - (this.timeRemaining / this.durationValue) * circumference
      this.progressRingTarget.style.strokeDashoffset = offset
    }

    // Update display target for fallback
    if (this.hasDisplayTarget) {
      this.displayTarget.textContent = this.formatTime(this.timeRemaining)
    }

    // Add urgency styling when time is running low
    if (this.timeRemaining <= 3) {
      this.element.classList.add("timer-urgent")
    }
  }

  formatTime(seconds) {
    return `${seconds}s`
  }

  handleTimeout() {
    if (this.autoSubmitValue) {
      // Add a visual indicator that time is up
      this.showTimeoutMessage()
      
      // Small delay to show the timeout message before navigation
      setTimeout(() => {
        if (this.hasFormTarget) {
          // Submit the form (even with no answer selected)
          this.submitFormWithTimeout()
        } else if (this.hasNextUrlValue) {
          // Navigate to next question
          window.location.href = this.nextUrlValue
        }
      }, 500)
    }
  }

  showTimeoutMessage() {
    if (this.hasSecondsTextTarget) {
      this.secondsTextTarget.textContent = "0"
      this.secondsTextTarget.classList.add("text-red-500")
    }
  }

  submitFormWithTimeout() {
    // Create a hidden input to indicate timeout submission
    const timeoutInput = document.createElement("input")
    timeoutInput.type = "hidden"
    timeoutInput.name = "timeout"
    timeoutInput.value = "true"
    this.formTarget.appendChild(timeoutInput)

    // Submit the form
    this.formTarget.requestSubmit()
  }
}
