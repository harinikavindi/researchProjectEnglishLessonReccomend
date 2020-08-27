import pandas as pd
from flask import Flask, jsonify, request
import pickle

# load model
model = pickle.load(open('model.pkl','rb'))

# app
app = Flask(__name__)

# routes
@app.route('/', methods=['POST'])

def recommend():
    # get data
    data = request.get_json(force=True)

    # convert data into dataframe
    data_df = pd.DataFrame.from_dict(data,orient='index')
    # Reccomendation
    result = model.corrwith(data_df)

    # send back to browser
    #output = {'results': int(result[0])}
    output = {'results': str(result[0])}

    # return data
    return jsonify(results=output)
    
    
if __name__ == '__main__':
    app.run(port = 5000, debug=True)