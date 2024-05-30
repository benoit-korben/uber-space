import { Controller } from "@hotwired/stimulus"

function getCSRFToken() {
  const metaTag = document.querySelector('meta[name="csrf-token"]');
  return metaTag ? metaTag.content : ''; // Return the token or an empty string if not found
}

// Connects to data-controller="bookings"
export default class extends Controller {

static targets = ["card"]
static values = {id: String}

update(event)  {
  fetch(`bookings/${this.idValue}`, { // URL of your Rails create/update action
    method: 'PATCH', // or 'PATCH' for updates
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-CSRF-Token': getCSRFToken() // Uncomment if using Rails for CSRF protection
    },
    body: JSON.stringify({
      // Your booking data here
      id: this.idValue,
      status: event.target.dataset["status"],
      // ...
    })
  })
  .then(response => {
    if (response.ok) {
      // Success: Handle the successful response (e.g., update UI, redirect)
      return response.json(); // If you expect JSON data back
    } else {
      // Error: Handle the error response (e.g., display an error message)
      throw new Error('Something went wrong');
    }
  })
  .then(data => {
    // Further processing if you have data from a successful response
    console.log(data)
    this.cardTarget.innerHTML = data;
  })
  .catch(error => {
    console.error('Error:', error);
  });
}
}
