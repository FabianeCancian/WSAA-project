// Global variable to store the article ID if editing an existing article
let id = null;

//Loads available sources for a dropdown
function getAllSourcesAjax() {
  $.ajax({
    url: "/sources", // Flask endpoint to get all sources
    method: "GET",
    data: "",
    dataType: "JSON",
    success: function (result) {
      listSources(result); // Populate dropdown with sources
    },
    error: function (xhr, status, error) {
      console.log("error: " + status + " msg:" + error);
    },
  });
}

//Handles creating or updating an article via form
function createArticleAjax() {
  const form = document.getElementById("article_form");
  if (form) {
    // Add an event listener for the "submit" event on the form
    form.addEventListener("submit", function (event) {
      event.preventDefault(); // Prevent page reload on submit

      let article = {};
      // Get form values
      article.source_id = form.elements["source_id"].value;
      article.author = form.elements["author"].value;
      article.title = form.elements["title"].value;
      article.description = form.elements["description"].value;
      article.url = form.elements["url"].value;
      article.urlToImage = form.elements["urlToImage"].value;
      article.publishedAt = form.elements["publishedAt"].value;
      article.content = form.elements["content"].value;

      if (id) {
        // If ID exists, update the article
        article.id = id;

        $.ajax({
          url: "/articles/" + id,
          method: "PUT",
          data: JSON.stringify(article),
          dataType: "JSON",
          contentType: "application/json; charset=utf-8",
          success: function () {
            window.location.href = "index.html"; // Redirect after save
          },
          error: function (xhr, status, error) {
            console.log("error: " + status + " msg:" + error);
          },
        });
      } else {
        // If no ID, it's a new article (POST)
        $.ajax({
          url: "/articles",
          method: "POST",
          data: JSON.stringify(article),
          dataType: "JSON",
          contentType: "application/json; charset=utf-8",
          success: function () {
            window.location.href = "index.html"; // Redirect after save
          },
          error: function (xhr, status, error) {
            console.log("error: " + status + " msg:" + error);
          },
        });
      }
    });
  }
}

// this is responsible for populating a <select> dropdown
function listSources(sources) {
  const select = document.getElementById("source_id");

  if (select) {
    // Loop through sources and create <option> elements
    sources.forEach((source) => {
      const option = document.createElement("option");
      option.value = source.id;
      option.text = source.name;
      select.appendChild(option);
    });
  }
  // After populating the dropdown, check if editing an article
  getArticle();
}

//Formats date values correctly for the input field
function formatDate(dateStr) {
  const date = new Date(dateStr); // Parse the date string

  const pad = (n) => n.toString().padStart(2, "0"); // Helper to format 2 digits

  // Format to 'YYYY-MM-DDTHH:MM:SS' (used by <input type="datetime-local">)
  const formattedDate =
    date.getFullYear() +
    "-" +
    pad(date.getMonth() + 1) +
    "-" +
    pad(date.getDate()) +
    "T" +
    pad(date.getHours()) +
    ":" +
    pad(date.getMinutes()) +
    ":" +
    pad(date.getSeconds());

  return formattedDate;
}

//Fills the form if editing an article
function getArticle() {
  // Create a URLSearchParams object from the current page's URL query string.
  const urlParams = new URLSearchParams(window.location.search);
  // Get the value of the "id" parameter from the query string.
  const articleId = urlParams.get("id");
  id = articleId; // Store globally

  if (articleId) {
    // If there's an article ID in URL, fetch the article to edit
    $.ajax({
      url: "/articles/" + articleId,
      method: "GET",
      data: "",
      dataType: "JSON",
      success: function (result) {
        var form = document.getElementById("article_form");
        // Pre-fill form fields with existing article data
        form.querySelector('select[name="source_id"]').value = result.source;
        form.querySelector('input[name="author"]').value = result.author;
        form.querySelector('input[name="title"]').value = result.title;
        form.querySelector('textarea[name="description"]').value =
          result.description;
        form.querySelector('input[name="url"]').value = result.url;
        form.querySelector('input[name="urlToImage"]').value =
          result.urlToImage;
        form.querySelector('input[name="publishedAt"]').value = formatDate(
          result.publishedAt
        );
        form.querySelector('textarea[name="content"]').value = result.content;
      },
      error: function (xhr, status, error) {
        console.log("error: " + status + " msg:" + error);
      },
    });
  }
}

// Initial Function Calls (Run on Page Load)
// Load the sources and check for article ID on page load
getAllSourcesAjax();

// Set up form submission handling
createArticleAjax();


// Code Source: https://github.com/andrewbeattycourseware/deploytopythonanywhere/blob/main/bookviewer.html