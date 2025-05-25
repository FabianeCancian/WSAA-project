from flask import Flask, jsonify, request, abort
from flask_cors import CORS, cross_origin
from news_crud import newsCRUD
# Create Flask application
app = Flask(__name__)
cors = CORS(app) # allow CORS for all domains on all routes.
app.config['CORS_HEADERS'] = 'Content-Type'

# Basic Welcome Route
@app.route('/')
@cross_origin()
def index():
    return "Welcome to Fab News API!"

# Get All Sources
@app.route('/sources')
@cross_origin()
def getAllSources():
    results = newsCRUD.getAllSources()
    return jsonify(results)

# Get All Articles
@app.route('/articles')
@cross_origin()
def getAllArticles():
    results = newsCRUD.getAllArticles()
    return jsonify(results)

# Get One Article by ID
@app.route('/articles/<int:id>')
@cross_origin()
def findByIdArticles(id):
    foundArticle = newsCRUD.findByID(id)

    return jsonify(foundArticle)

# Create a New Source
@app.route('/sources', methods=['POST'])
@cross_origin()
def createSources():

    if not request.json:
        abort(400)
    source = {
        "name": request.json['name']
    }
    addedSource= newsCRUD.create(source, 'sources')
    
    return jsonify(addedSource)

# Create a New Article
@app.route('/articles', methods=['POST'])
@cross_origin()
def createArticles():
    
    if not request.json:
        abort(400)
    # Extract fields from the JSON request
    article = {
        "source_id": request.json['source_id'],
        "title": request.json['title'],
        "author": request.json['author'],
        "description": request.json['description'],
        "url": request.json['url'],
        "urlToImage": request.json['urlToImage'],
        "publishedAt": request.json['publishedAt'],
        "content": request.json['content'],

    }
    addedArticle= newsCRUD.create(article, 'articles')
    
    return jsonify(addedArticle)

# Update an Existing Article
@app.route('/articles/<int:id>', methods=['PUT'])
@cross_origin()
def updateArticles(id):
    foundArticle = newsCRUD.findByID(id)
    if not foundArticle:
        abort(404)
    
    if not request.json:
        abort(400)
    reqJson = request.json
    # Update fields if they are present in the request
    if 'source_id' in reqJson:
        foundArticle['source_id'] = reqJson['source_id']
    if 'title' in reqJson:
        foundArticle['title'] = reqJson['title']
    if 'author' in reqJson:
        foundArticle['author'] = reqJson['author']
    if 'description' in reqJson:
        foundArticle['description'] = reqJson['description']
    if 'url' in reqJson:
        foundArticle['url'] = reqJson['url']
    if 'urlToImage' in reqJson:
        foundArticle['urlToImage'] = reqJson['urlToImage']
    if 'publishedAt' in reqJson:
        foundArticle['publishedAt'] = reqJson['publishedAt']
    if 'content' in reqJson:
        foundArticle['content'] = reqJson['content']
    newsCRUD.update(id,foundArticle, 'articles')
    return jsonify(foundArticle)

# Delete an Article by ID
@app.route('/articles/<int:id>' , methods=['DELETE'])
@cross_origin()
def deleteArticles(id):
    newsCRUD.delete(id)
    return jsonify({"done":True})

# Entry Point - Run Server
if __name__ == '__main__' :
    app.run(debug= True)

# Code source: https://github.com/andrewbeattycourseware/deploytopythonanywhere/blob/main/server.py