// This function sets up an AJAX-based form submission to create a new news source
function createSourceAjax() {
  // Get the form element with ID "source_form"
  const form = document.getElementById("source_form");
  if (form) {
    // Add an event listener for the "submit" event on the form
    form.addEventListener("submit", function (event) {
      event.preventDefault(); // Prevent page reload on submit

      let source = {};
      // Get form values
      source.name = form.elements["name"].value;

      // Make an AJAX POST request to the Flask backend API to add the new source
      $.ajax({
        url: "/sources",
        method: "POST",
        data: JSON.stringify(source),
        dataType: "JSON",
        contentType: "application/json; charset=utf-8",
        success: function () {
        // On successful creation, redirect the user back to the homepage
          window.location.href = "index.html";
        },
        error: function (xhr, status, error) {
          console.log("error: " + status + " msg:" + error);
        },
      });
    });
  }
}


// Call the function to activate it on page load
createSourceAjax();

// Code Source: https://github.com/andrewbeattycourseware/deploytopythonanywhere/blob/main/bookviewer.html
