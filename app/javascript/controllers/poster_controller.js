import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "image", "url" ]

  initialize() {

    this.imageTarget.src = this.urlTarget.value
  }
}