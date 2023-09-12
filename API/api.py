from flask import Flask
from flask_restful import Api,Resource,reqparse
from transformers import pipeline
classifier = pipeline("text-classification",model='bhadresh-savani/distilbert-base-uncased-emotion', top_k=1)

"""
This is a sentiment analysis API that uses the DistilBERT uncased emotion model from HuggingFace.

The DistilBERT uncased emotion model is a pre-trained model that is able to identify six different emotions in text data: sadness, joy, love, anger, fear, and surprise. 
The model has been trained on a large dataset of text data that has been annotated with these six emotion categories, so it is able to recognize patterns in the text that correspond to each of these emotions.

To use this API, send a post request to the /sentiment endpoint with a string in the body of the request. The API will return the sentiment of the string and the probability score of the sentiment.
"""

def analysis(content=""):
    try:
        prediction = classifier(content)
        label=prediction[0][0]["label"]
        score=prediction[0][0]["score"]

        return label,score
    except:
        return "Error","Error"


app=Flask((__name__))
api=Api(app)
print("APP active")
sentiment_Arg=reqparse.RequestParser()
sentiment_Arg.add_argument("string",type=str,help="Send string to be classified")


# Example post request:
# {"string":"I am happy"}

class sentiment(Resource):
    """
    This class is used to classify the sentiment of a string
    
    Usage:
    1. Get request to check if the API is active
    2. Post request to classify the sentiment of a string

    """

    def get(self):

        ''''
        This function is used to check if the API is active
            Returns:
                message: API active
        '''

        return {"message":"API active"}

    def post(self):

        '''
        This function is used to classify the sentiment of a string

            Accepts:
                string: string to be classified
            
            Returns:
                sentiment: sentiment of the string
                score: probabilty score of the sentiment
        
        '''


        try:
            args=sentiment_Arg.parse_args()
            print(args)
            string=args["string"]
            pred,score=analysis(string)
            return {"sentiment":str(pred),"score":str(score)} 

        except:
            return {"message":"Error"}


api.add_resource(sentiment,"/sentiment")

if __name__=="__main__":
    app.run(host='192.168.118.27', port=5000, debug=True)