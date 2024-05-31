import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notifications"
export default class extends Controller {
  static targets = [ "toast", "icon" ]

  connect() {
    // console.log("Notifications controller connected")
  }

  markAsRead() {
    if (this.toastTarget.classList.contains("unread")) {
      this.toastTarget.classList.remove("unread")
      this.toastTarget.classList.add("read")
    }

    if (this.iconTarget.classList.contains("fa-bell")) {
      this.iconTarget.classList.remove("fa-bell")
      this.iconTarget.classList.add("fa-bell-slash")

      setTimeout(() => {
        this.iconTarget.classList.remove("fa-bell-slash")
        this.iconTarget.classList.remove("bg-info")
        this.iconTarget.classList.add("bg-success")
        this.iconTarget.classList.add("fa-check")
        this.iconTarget.style.opacity = 1;
        this.iconTarget.style.cursor = "initial";
      }, 2000);
    }
  }
}
