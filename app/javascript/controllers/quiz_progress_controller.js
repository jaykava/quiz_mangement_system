import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bar"]

  connect() {
    this.animateProgress()
  }

  animateProgress() {
    const bar = this.barTarget
    const width = bar.style.width
    bar.style.width = '0%'
    
    setTimeout(() => {
      bar.style.width = width
    }, 100)
  }
}
