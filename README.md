# Project Description
Fab News is a full-stack web application that demonstrates how to create and consume a RESTful API using Flask. It allows users to manage news articles and their sources through a modern web interface and API endpoints.

## Project Overview

This project was created to fulfill the requirements of demonstrating:

- Building and exposing a RESTful API with Flask
- Connecting the API to a relational database (MySQL)
- Creating web pages that consume the API using JavaScript
- Performing full CRUD operations on database records

The app features:
- Article management (Create, Read, Update, Delete)
- Source management
- A RESTful backend
- A dynamic frontend styled with Tailwind CSS
- Query-powered AJAX calls for a smooth user experience

## Tech Stack
- Backend: Flask, Flask-CORS
- Frontend: HTML, Tailwind CSS, JavaScript (jQuery)
- Database: MySQL
- API: RESTful endpoints with JSON responses

## Features

### RESTful API:
- /articles - GET, POST
- /articles/<id> - GET, PUT, DELETE
- /sources - GET, POST

### Web Interface:
- Add and manage news sources
- Submit and edit articles
- View all articles
- Delete articles

## How to Run Locally
Clone the repository and run the commands:
```
git clone https://github.com/yourusername/fab-news.git
cd fab-news
python -m venv venv
.\venv\Scripts\activate.bat
pip install -r requirements.txt
python server.py
```

You might need to update the AJAX to point to your local server. e.g:

From:
```
url: "/articles"
```
To:
```
url: "127.0.0.1/articles"
```

Open index.html in your browser to use the web interface.

### Database setup
Execute the queries in `queries.sql`

## Deployment

Fab News was deployed to the platform PythonAnywhere. It was configured the environment using Flask and Flask-CORS and the database connection is in the `dbconfig.py`. To run it locally please update the file.

[Fabi News](https://fabi.pythonanywhere.com/index.html)


# References:

The idea of a news web application came from the [NewsAPI](https://newsapi.org/), I used this API as a reference for the database of this project with small modifications. The inital data in `queries.sql` is based on the same API. 

- [Project Description](https://vlegalwaymayo.atu.ie/pluginfile.php/1496651/mod_resource/content/15/WSAA%20Project%20Description.pdf)
- [Data Source](https://newsapi.org/)
- [Code Source](https://github.com/andrewbeattycourseware/deploytopythonanywhere)
- [Artificial Inteligence tool to research errors and spelling check](https://chatgpt.com/)
- [Frontend Layout - HTML and CSS](https://tailwindcss.com/plus/ui-blocks/preview)
- [CSS Library](https://tailwindcss.com/)
- [JS Events](https://www.w3schools.com/jsref/event_onclick.asp)

### AI Prompts:
- I'm getting a pip dependency conflict when installing packages. Here's the error message: [paste error]. How can I resolve it?
- I'm deploying my Flask app and got a `ModuleNotFoundError`. The missing module is [module_name]. How do I fix this on PythonAnywhere?
- My AJAX request using jQuery isn't working. Here's the code I'm using and the error I'm seeing in the console: [paste code + error]. Can you help me debug this?
- I'm trying to extract a query string parameter from the URL using JavaScript, but it's not working. Here's the code: [paste code]. What am I doing wrong?
