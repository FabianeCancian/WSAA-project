#import requests
from projectkey import API_KEY
from datetime import datetime # Required for date formatting

# I used the news api to populate my database.
# url = f'https://newsapi.org/v2/top-headlines?&apiKey={API_KEY}'
# response = requests.get(url).json()
# print(response['articles'])


import mysql.connector
import dbconfig as cfg

# Define the NewsCRUD class to interact with the database
class NewsCRUD:

    # Define class-level attributes for DB connection and cursor
    connection=''
    cursor =''
    host=       ''
    user=       ''
    password=   ''
    database=   ''
    
    # Initialize database credentials from dbconfig
    def __init__(self):
        self.host=       cfg.mysql['host']
        self.user=       cfg.mysql['user']
        self.password=   cfg.mysql['password']
        self.database=   cfg.mysql['database']

    # Get a new DB cursor and open a connection
    def getcursor(self): 
        self.connection = mysql.connector.connect(
            host=       self.host,
            user=       self.user,
            password=   self.password,
            database=   self.database,
        )
        self.cursor = self.connection.cursor()
        return self.cursor

    # Close both the connection and the cursor
    def closeAll(self):
        self.connection.close()
        self.cursor.close()

    # Fetch all rows from the 'sources' table
    def getAllSources(self):
        cursor = self.getcursor()
        sql="select * from sources"
        cursor.execute(sql)
        results = cursor.fetchall()
        returnArray = []
        for result in results:
            returnArray.append(self.convertToDictionary(result, 'sources'))
        
        self.closeAll()
        return returnArray

    # Fetch all articles with their source names using a JOIN     
    def getAllArticles(self):
        cursor = self.getcursor()
        sql = """
            SELECT 
                articles.id,
                sources.name AS source,
                articles.author,
                articles.title,
                articles.description,
                articles.url,
                articles.urlToImage,
                articles.publishedAt,
                articles.content
            FROM articles
            JOIN sources ON articles.source_id = sources.id;
            """

        cursor.execute(sql)
        results = cursor.fetchall()
        returnArray = []
        for result in results:
            returnArray.append(self.convertToDictionary(result, 'articles'))
        
        self.closeAll()
        return returnArray
    
    # Find a specific article by ID
    def findByID(self, id):
        cursor = self.getcursor()
        sql = f'SELECT * FROM articles WHERE id = %s'
        cursor.execute(sql, (id,))
        result = cursor.fetchone()
        returnvalue = self.convertToDictionary(result, 'articles')
        # Convert datetime to JS-friendly format if needed
        if returnvalue and isinstance(returnvalue['publishedAt'], datetime):
            returnvalue['publishedAt'] = returnvalue['publishedAt'].strftime('%Y-%m-%dT%H:%M')

        self.closeAll()
        return returnvalue

    # Create a new row in either 'articles' or 'sources' table
    def create(self, item, table):
        cursor = self.getcursor()

        if (table == 'articles'):
            sql='insert into articles (source_id,title,author,description,url,urlToImage,publishedAt,content) values (%s,%s,%s,%s,%s,%s,%s, %s)'
            values = (item.get('source_id'),item.get('title'), item.get('author'), item.get('description'), item.get('url'), item.get('urlToImage'), item.get('publishedAt'),  item.get('content'))

        if (table == 'sources'):
            sql='insert into sources (name) values (%s)'
            values = (item.get('name'),)

        cursor.execute(sql, values)

        self.connection.commit()
        newid = cursor.lastrowid
        # Return item with new ID
        item['id'] = newid
        self.closeAll()
        return item


    # Update an existing record in either table
    def update(self, id, item, table):
        cursor = self.getcursor()

        
        if (table == 'articles'):
            sql='update articles set source_id=%s,title= %s,author=%s,description=%s,url=%s,urlToImage=%s,publishedAt=%s,content=%s  where id = %s'
            values = (item.get('source_id'), item.get('title'), item.get('author'), item.get('description'), item.get('url'), item.get('urlToImage'), item.get('publishedAt'),  item.get('content'), id)

        if (table == 'sources'):
            sql='update sources set name= %s  where id = %s'
            values = (item.get('name'),id)
            
    
        cursor.execute(sql, values)
        self.connection.commit()
        self.closeAll()

    # Delete an article by ID    
    def delete(self, id):
        cursor = self.getcursor()
        sql = 'DELETE FROM articles WHERE id = %s'
        cursor.execute(sql, (id,))

        self.connection.commit()
        self.closeAll()

    # Convert SQL row result into dictionary depending on the table
    def convertToDictionary(self, resultLine, type):
        if (type == 'articles'):
            attkeys=['id','source','author','title','description', 'url','urlToImage','publishedAt','content']
            article = {}
            currentkey = 0
            for attrib in resultLine:
                article[attkeys[currentkey]] = attrib
                currentkey = currentkey + 1 
            return article
        
        if (type == 'sources'):
            attkeys=['id','name']
            source = {}
            currentkey = 0
            for attrib in resultLine:
                source[attkeys[currentkey]] = attrib
                currentkey = currentkey + 1 
            return source

# Create an instance of the class for external use        
newsCRUD = NewsCRUD()

# Code source: https://github.com/andrewbeattycourseware/deploytopythonanywhere/blob/main/bookDAO.py