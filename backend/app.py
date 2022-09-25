from math import ceil
import uuid
from flask import Flask, request, jsonify
from API.firebase import storeAlphabets, storeMainImage
from API.functions import directoryHandler
from machineModel.ml import prediction_fun

app = Flask(__name__)

UPLOAD = 'uploads/'
PREDICTION = 'prediction/'
OUT_OF_SCORE = 20


@app.route('/')
def index():
    HTML = '''
    <div style="font-family:Arial;text-align:center;">
        <h1>unScrawl</h1>
        <h3>API IS RUNNING!</h3>
    </div>
        '''
    return HTML


@app.route('/upload', methods=['POST'])
def upload():
    imageFile = request.files['image']

    directoryHandler('check', UPLOAD, PREDICTION)
    directoryHandler('make', UPLOAD, PREDICTION)

    # Save Uploaded Image
    uploadedFilePath = UPLOAD+'uploaded_image.png'
    imageFile.save(uploadedFilePath)

    # Model
    alphabetList, mainImagePath, score, error, totalWords, topFour, alphabetMistake = prediction_fun(
        PREDICTION, UPLOAD, uploadedFilePath)

    # Firebase Storage
    directoryName = str(uuid.uuid4())
    storeMainImage(directoryName, mainImagePath)
    storeAlphabets(directoryName, alphabetList)

    directoryHandler('remove', UPLOAD, PREDICTION)

    return jsonify(
        status='Uploaded Successfully',
        folderID=directoryName,
        score=ceil(OUT_OF_SCORE*score),
        totalWords=totalWords,
        incorrectWords=len(alphabetList),
        alphabets=alphabetMistake,
        topFourAlphabets=topFour,
    )
