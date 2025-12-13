import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["optionsContainer", "optionField", "correctCheckbox", "matchKeyField"]

  connect() {
    this.optionIndex = this.optionFieldTargets.length
  }

  typeChanged(event) {
    const type = event.target.value
    
    this.optionFieldTargets.forEach(field => {
      const correctCheckbox = field.querySelector('[data-question-form-target="correctCheckbox"]')
      const matchKeyField = field.querySelector('[data-question-form-target="matchKeyField"]')
      
      if (type === 'matching') {
        correctCheckbox.classList.add('hidden')
        matchKeyField.classList.remove('hidden')
      } else {
        correctCheckbox.classList.remove('hidden')
        matchKeyField.classList.add('hidden')
      }
    })
  }

  addOption(event) {
    event.preventDefault()
    
    const questionType = document.querySelector('select[name="question[question_type]"]').value
    const newOption = this.createOptionField(questionType)
    this.optionsContainerTarget.insertAdjacentHTML('beforeend', newOption)
    this.optionIndex++
  }

  removeOption(event) {
    event.preventDefault()
    
    const optionField = event.target.closest('[data-question-form-target="optionField"]')
    const destroyField = optionField.querySelector('input[name*="_destroy"]')
    
    if (destroyField) {
      destroyField.value = '1'
      optionField.style.display = 'none'
    } else {
      optionField.remove()
    }
  }

  createOptionField(questionType) {
    const isMatching = questionType === 'matching'
    const timestamp = new Date().getTime()
    
    return `
      <div class="border border-gray-200 rounded-lg p-4 mb-3" data-question-form-target="optionField">
        <div class="flex gap-4 items-start">
          <div class="flex-1">
            <input type="text" 
                   name="question[options_attributes][${timestamp}][content]" 
                   class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                   placeholder="Enter option text..." />
          </div>
          
          <div class="flex items-center gap-2 ${isMatching ? 'hidden' : ''}" data-question-form-target="correctCheckbox">
            <input type="checkbox" 
                   name="question[options_attributes][${timestamp}][correct]" 
                   value="1"
                   class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded" />
            <label class="text-sm text-gray-700">Correct</label>
          </div>
          
          <div class="${isMatching ? '' : 'hidden'}" data-question-form-target="matchKeyField">
            <input type="text" 
                   name="question[options_attributes][${timestamp}][match_key]" 
                   class="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                   placeholder="Match value..." />
          </div>
          
          <button type="button" 
                  data-action="click->question-form#removeOption"
                  class="text-red-600 hover:text-red-800">
            <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd" />
            </svg>
          </button>
        </div>
        <input type="hidden" name="question[options_attributes][${timestamp}][_destroy]" value="0" />
      </div>
    `
  }
}
