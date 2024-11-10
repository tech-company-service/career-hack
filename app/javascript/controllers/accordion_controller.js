import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "content", "icon"];

  toggle(event) {
    const index = this.buttonTargets.indexOf(event.currentTarget);

    const content = this.contentTargets[index];
    const icon = this.iconTargets[index];

    if (content.style.display === "none" || content.style.display === "") {
      content.style.display = "block";
      icon.textContent = "▼";
    } else {
      content.style.display = "none";
      icon.textContent = "▶︎";
    }
  }
}
