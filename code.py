import requests
from projectkey import API_KEY

url = f"https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey={API_KEY}"
response = requests.get(url).json()
print(response['articles'][0])