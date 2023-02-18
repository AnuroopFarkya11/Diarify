import requests
data = {"string": "I am happy"}
response = requests.post("http://localhost:5000/sentiment", json=data)
print(response.json())