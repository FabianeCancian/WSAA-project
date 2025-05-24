import requests
from projectkey import API_KEY

# url = f"https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey={API_KEY}"
# response = requests.get(url).json()
# print(response['articles'][0])

#-------
import mysql.connector
import dbconfig as cfg
class NewsCRUD:
    connection=""
    cursor =''
    host=       ''
    user=       ''
    password=   ''
    database=   ''
    
    def __init__(self):
        self.host=       cfg.mysql['host']
        self.user=       cfg.mysql['user']
        self.password=   cfg.mysql['password']
        self.database=   cfg.mysql['database']

    def getcursor(self): 
        self.connection = mysql.connector.connect(
            host=       self.host,
            user=       self.user,
            password=   self.password,
            database=   self.database,
        )
        self.cursor = self.connection.cursor()
        return self.cursor

    def closeAll(self):
        self.connection.close()
        self.cursor.close()
         
    def getAll(self, table):
        cursor = self.getcursor()
        sql="select * from %s"
        values = (table)
        cursor.execute(sql, values)
        results = cursor.fetchall()
        returnArray = []
        for result in results:
            returnArray.append(self.convertToDictionary(result))
        
        self.closeAll()
        return returnArray

    def findByID(self, id, table):
        cursor = self.getcursor()
        sql="select * from %s where id = %s"
        values = (table, id)

        cursor.execute(sql, values)
        result = cursor.fetchone()
        returnvalue = self.convertToDictionary(result)
        self.closeAll()
        return returnvalue

    def create(self, book, table):
        cursor = self.getcursor()

        if (table == 'articles'):
            sql="insert into articles (title,author, price) values (%s,%s,%s,%s,%s,%s,%s)"
            values = (articles.get("title"), articles.get("author"), articles.get("description"), articles.get("url"), articles.get("urlToImage"), articles.get("publishedAt"),  articles.get("content"))

        if (table == 'sources'):
            sql="insert into Source (name) values (%s)"
            values = (sources.get("Name"))

        cursor.execute(sql, values)

        self.connection.commit()
        newid = cursor.lastrowid
        book["id"] = newid
        self.closeAll()
        return book


    def update(self, id, book, table):
        cursor = self.getcursor()

        if (table == 'articles'):
            sql="update book set title= %s,author=%s, description=%s,url=%s,urlToImage=%s,publishedAt=%s,content=%s  where id = %s"
            values = (articles.get("title"), articles.get("author"), articles.get("description"), articles.get("url"), articles.get("urlToImage"), articles.get("publishedAt"),  articles.get("content", id))

        if (table == 'sources'):
            sql="update book set Name= %s  where id = %s"
            values = (source.get("name"),id)
            
        cursor.execute(sql, values)
        self.connection.commit()
        self.closeAll()
        
    def delete(self, id, table):
        cursor = self.getcursor()
        sql="delete from book where id = %s"
        values = (id,)

        cursor.execute(sql, values)

        self.connection.commit()
        self.closeAll()

    def convertToDictionary(self, resultLine):
        attkeys=['id','title','author', "price"]
        book = {}
        currentkey = 0
        for attrib in resultLine:
            book[attkeys[currentkey]] = attrib
            currentkey = currentkey + 1 
        return book

        
newsCRUD = NewsCRUD()