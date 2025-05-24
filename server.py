from flask import Flask, jsonify, request, abort
from flask_cors import CORS, cross_origin
app = Flask(__name__)
cors = CORS(app) # allow CORS for all domains on all routes.
app.config['CORS_HEADERS'] = 'Content-Type'

from code import newsCRUD

app = Flask(__name__, static_url_path='', static_folder='.')

#app = Flask(__name__)

@app.route('/')
@cross_origin()
def index():
    return "Hello, World!"

#curl "http://127.0.0.1:5000/sources"
@app.route('/sources')
@cross_origin()
def getAll():
    table = 'sources'
    results = newsCRUD.getAll(table)
    return jsonify(results)

#curl "http://127.0.0.1:5000/articles"
@app.route('/articles')
@cross_origin()
def getAll():
    table = 'articles'
    results = newsCRUD.getAll(table)
    return jsonify(results)

#curl "http://127.0.0.1:5000/articles/2"
@app.route('/articles/<int:id>')
@cross_origin()
def findById(id):
    table = 'articles'
    foundArticle = newsCRUD.findByID(id,table)

    return jsonify(foundArticle)

#curl  -i -H "Content-Type:application/json" -X POST -d "{\"title\":\"hello\",\"author\":\"someone\",\"price\":123}" http://127.0.0.1:5000/books
@app.route('/books', methods=['POST'])
@cross_origin()
def create():
    
    if not request.json:
        abort(400)
    # other checking 
    article = {
        "title": request.json['title'],
        "author": request.json['author'],
        "description": request.json['description'],
        "url": request.json['url'],
        "urlToImage": request.json['urlToImage'],
        "publishedAt": request.json['publishedAt'],
        "content": request.json['content'],

    }
    addedArticle= newsCRUD.create(article, table, fields)
    
    return jsonify(addedArticle)

#curl  -i -H "Content-Type:application/json" -X PUT -d "{\"title\":\"hello\",\"author\":\"someone\",\"price\":123}" http://127.0.0.1:5000/books/1
@app.route('/books/<int:id>', methods=['PUT'])
@cross_origin()
def update(id):
    foundArticle = newsCRUD.findByID(id)
    if not foundArticle:
        abort(404)
    
    if not request.json:
        abort(400)
    reqJson = request.json
    if 'price' in reqJson and type(reqJson['price']) is not int:
        abort(400)

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
    newsCRUD.update(id,foundArticle, table, fields)
    return jsonify(foundArticle)
        

    

@app.route('/books/<int:id>' , methods=['DELETE'])
@cross_origin()
def delete(id, table):
    newsCRUD.delete(id, table)
    return jsonify({"done":True})




if __name__ == '__main__' :
    app.run(debug= True)