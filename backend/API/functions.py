import os
import shutil


def directoryHandler(handler, uploadFolderName, predictionFolderName):
    if handler == 'check':
        if os.path.exists(uploadFolderName):
            shutil.rmtree(uploadFolderName)
        if os.path.exists(predictionFolderName):
            shutil.rmtree(predictionFolderName)
    elif handler == 'make':
        os.mkdir(uploadFolderName)
        os.mkdir(predictionFolderName)
    elif handler == 'remove':
        shutil.rmtree(uploadFolderName)
        shutil.rmtree(predictionFolderName)
    else:
        print('Undefined Handler')
