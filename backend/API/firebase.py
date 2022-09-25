import os
import firebase_admin
from firebase_admin import credentials
from firebase_admin import storage

# Initializes GoogleServiceAccount Credentials
cred = credentials.Certificate(os.environ['serviceAccountKey'])

# Initializes FirebaseApp
firebase_admin.initialize_app(
    cred, {'storageBucket': os.environ['storageBucket']})
# Firebase Storage Handler
firebaseStorage = storage.bucket()


# Firebase Storage Upload
def storeMainImage(directoryName, mainImagePath):
    blob = firebaseStorage.blob(directoryName+'/main.png')
    blob.upload_from_filename(mainImagePath)


def storeAlphabets(directoryName, alphabetList):
    for item in alphabetList:
        blob = firebaseStorage.blob(
            directoryName+'/alphabets/'+item['path'].split('/')[1])
        blob.upload_from_filename(item['path'])
