// HTML template for rendering a single article card
const template = `
<article class="flex max-w-xl flex-col items-start justify-between border-2 border-solid border-gray-200 rounded-md p-2 shadow-md">
  <div class="flex items-center gap-x-4 text-xs">
    <time class="text-gray-500">$publishedAt</time>
    <a href="#" class="relative z-10 rounded-full bg-gray-50 px-3 py-1.5 font-medium text-gray-600 hover:bg-gray-100">$source</a>,
  </div>
  <div class="group relative">
    <h3 class="mt-3 text-lg/6 font-semibold text-gray-900 group-hover:text-gray-600">
      <a href="#"><span class="absolute inset-0"></span>$title</a>
    </h3>
    <div class="text-sm/6">
      <p class="font-semibold text-gray-900">
        <a href="#"><span class="absolute inset-0"></span>$author</a>
      </p>
    </div>
    <p class="mt-5 line-clamp-3 text-sm/6 text-gray-600">$description</p>
  </div>
  <div class="relative mt-8 flex items-center gap-x-4">
    <img src="$urlToImage" alt="No Image..." />
  </div>
  <div class="group relative">
    <p class="mt-5 line-clamp-3 text-sm/6 text-gray-600">$content</p>
  </div>
  <div class="mt-10 flex items-center justify-center gap-x-6">
  <button type="button" onclick="openArticle('$url')" class="my-2 rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-xs hover:bg-indigo-500">Read</button>
  <button type="button" onclick="editArticle('$id')" class="my-2 rounded-md bg-gray-600 px-3 py-2 text-sm font-semibold text-white shadow-xs hover:bg-gray-500">Edit</button>
  <button type="button" onclick="deleteArticle('$id')" class="my-2 rounded-md bg-red-600 px-3 py-2 text-sm font-semibold text-white shadow-xs hover:bg-red-500">Delete</button>
  </div>
</article>`;

// Renders all articles into the DOM by replacing placeholders in the template
function showArticles(articles) {
  const container = document.getElementById("articles");

  if (container) {
    articles.forEach((article) => {
      let html = template;
       // Get all keys in the article object (e.g. 'author', 'title', etc.)
      const keys = Object.keys(article).sort((a, b) => b.length - a.length);

      // Replace placeholders in template with actual values
      keys.forEach((key) => {
        const regex = new RegExp(`\\$${key}`, "g");
        html = html.replace(regex, article[key]);
      });
      
      // Append the final HTML for the article
      container.innerHTML += html;
    });
  }
}

// Opens the article's full URL in a new tab
function openArticle(url) {
  window.open(url, "_blank");
}

// Redirects to article.html with the article's ID for editing
function editArticle(id) {
  window.location.href = "article.html?id="+id;
}

// Fetches all articles from the backend API and displays them
function getAllArticlesAjax() {
  $.ajax({
    url: "http://127.0.0.1:5000/articles",
    method: "GET",
    data: "",
    dataType: "JSON",
    success: function (result) {
      showArticles(result); // render the received articles
    },
    error: function (xhr, status, error) {
      console.log("error: " + status + " msg:" + error);
    },
  });
}

// Deletes an article by ID, then reloads the page to update the view
function deleteArticle(id) {
  $.ajax({
    url: "http://127.0.0.1:5000/articles/" + encodeURI(id),
    method: "DELETE",
    data: "",
    dataType: "JSON",
    contentType: "application/json; charset=utf-8",
    success: function () {
      location.reload(); // refresh the page after deletion
    },
    error: function (xhr, status, error) {
      console.log("error: " + status + " msg:" + error);
    },
  });
}

// Initial call to fetch and display articles when the script loads
getAllArticlesAjax();

//Code Source: https://github.com/andrewbeattycourseware/deploytopythonanywhere/blob/main/bookviewer.html
//Code Source: https://tailwindcss.com/plus/ui-blocks/preview
