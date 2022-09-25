import os
import pickle
from collections import Counter

import cv2
import numpy as np
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.layers.experimental.preprocessing import StringLookup

from machineModel.wordSeparator import (prepare_dataset, prepare_path_list,
                                        process_page)

batch_size = 64
image_width = 128
image_height = 32


pred_model = keras.models.load_model(
    "machineModel/savedWeights/customPredModel.h5")


with open("machineModel/savedWeights/charList.pkl", "rb") as fp:
    characters = pickle.load(fp)


# Mapping characters to integers.
char_to_num = StringLookup(vocabulary=list(characters), mask_token=None)

# Mapping integers back to original characters.
num_to_char = StringLookup(
    vocabulary=char_to_num.get_vocabulary(), mask_token=None, invert=True
)


def decode_batch_predictions(pred):
    char_to_num = StringLookup(vocabulary=list(characters), mask_token=None)

    num_to_char = StringLookup(
        vocabulary=char_to_num.get_vocabulary(), mask_token=None, invert=True
    )

    input_len = np.ones(pred.shape[0]) * pred.shape[1]

    results = keras.backend.ctc_decode(pred, input_length=input_len, greedy=True)[0][0][
        :, :17
    ]

    output_text = []
    for res in results:
        res = tf.gather(res, tf.where(tf.math.not_equal(res, -1)))
        res = tf.strings.reduce_join(num_to_char(res)).numpy().decode("utf-8")

        output_text.append(res)
    return output_text


def listToString(s):
    str1 = " "
    return (str1.join(s))


def alphabet_probability(preds, pred_texts, path_list):
    probabilities = np.zeros([preds.shape[0], preds.shape[1], 2])
    prob = np.zeros([preds.shape[0], preds.shape[1]])
    for i in range(preds.shape[0]):
        prob[i] = np.argmax(preds[i, :, :len(characters)], axis=1)

    for i in range(preds.shape[0]):
        for j in range(preds.shape[1]):
            probabilities[i][j][0] = int(prob[i][j])
            probabilities[i][j][1] = preds[i][j][int(prob[i][j])]

    resultant = []
    for i in range(probabilities.shape[0]):
        res1 = []
        for jx in range(probabilities.shape[1]):
            res = []
            charx = tf.strings.reduce_join(num_to_char(
                probabilities[i][jx][0])).numpy().decode("utf-8")
            if res1:
                last_pro = probabilities[i][jx-1][1]
                if (res1[-1][0] == charx) and (last_pro > 0.35):
                    res1[-1][1] = max(probabilities[i][jx][1], res1[-1][1])
                elif (probabilities[i][jx][1] > 0.42):
                    res.append(charx)
                    res.append(probabilities[i][jx][1])
            elif (probabilities[i][jx][1] > 0.42):
                res.append(charx)
                res.append(probabilities[i][jx][1])
            if res:
                res1.append(res)
        if res1:
            resultant.append(res1)

    listing = []
    result = {}
    label_key = "label"
    path_key = "path"
    alphabets_key = "alphabets"

    for ix in range(len(resultant)):
        if any(ele[1] < 0.70 for ele in resultant[ix]):
            result = {label_key: "", path_key: "", alphabets_key: []}
            result[label_key] = pred_texts[ix]
            result[path_key] = path_list[ix]
            result[alphabets_key] = resultant[ix]
            listing.append(result)

    return listing


def mainImage(uploadFolderPath, filePath):
    img = cv2.imread(filePath)
    h = img.shape[0]
    factor = 1500 / h
    img = cv2.resize(img, dsize=None, fx=factor, fy=factor)
    mainImagePath = uploadFolderPath+'main.png'
    return img, mainImagePath


def top4(listing):
    newList = []
    for dicto in listing:
        str1 = ""
        for alphabet in dicto['alphabets']:
            if alphabet[1] < 0.70:
                str1 = str1+alphabet[0]
        if str1:
            newList.append(str1)

    res = list(''.join(newList))
    result = [item for items, c in Counter(
        res).most_common() for item in [items] * c]
    myList = list(dict.fromkeys(result))
    return myList[:4], newList


def prediction_fun(predictionFolderPath, uploadFolderPath, filePath):
    pathToCoordinate = process_page(predictionFolderPath, filePath)
    path_list = prepare_path_list(predictionFolderPath)
    img, mainImagePath = mainImage(uploadFolderPath, filePath)
    ds = prepare_dataset(path_list)

    for batch in ds.take(1):
        batch_images = batch["image"]

        preds = pred_model.predict(batch_images)
        pred_texts = decode_batch_predictions(preds)
    alpha_probability = alphabet_probability(preds, pred_texts, path_list)
    for word in alpha_probability:
        coordinate = pathToCoordinate[word["path"]]
        st = (coordinate.x, coordinate.y)
        ed = ((coordinate.x + coordinate.w), (coordinate.y + coordinate.h))
        cv2.rectangle(img, st, ed, (53, 34, 157), 2)
    cv2.imwrite(mainImagePath, img)

    score = 1 - len(alpha_probability)/len(pathToCoordinate)
    top4Alpha, resultList = top4(alpha_probability)

    return alpha_probability, mainImagePath, score, len(alpha_probability), len(pathToCoordinate), top4Alpha, resultList
