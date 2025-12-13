import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Initialize drag and drop for matching questions if needed
    console.log("Matching controller connected")
  }

  // Could add drag-and-drop functionality here in the future
}
