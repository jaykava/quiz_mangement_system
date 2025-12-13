import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Add fade-in animation to form elements
    this.element.querySelectorAll('label, .border-2').forEach((el, index) => {
      el.style.opacity = '0'
      el.style.transform = 'translateY(10px)'
      
      setTimeout(() => {
        el.style.transition = 'all 0.3s ease-out'
        el.style.opacity = '1'
        el.style.transform = 'translateY(0)'
      }, index * 50)
    })
  }

  submit(event) {
    const form = event.target
    const submitButton = form.querySelector('input[type="submit"]')
    
    if (submitButton) {
      submitButton.disabled = true
      submitButton.value = 'Loading...'
    }
  }
}
