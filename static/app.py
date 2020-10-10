#Flask Powered App

#import flask
from flask import Flask

#initialize
app = Flask(__name__)

#define index route
#@app.route("/")
#def home():
    #print("Server received request for 'Home' page...")
    #return "Welcome to my 'Home' page!"

#define route for each page in the website


#run
if __name__ == "__main__":
    app.run(debug=True)