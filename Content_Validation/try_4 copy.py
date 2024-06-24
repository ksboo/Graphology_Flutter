import os
from flask import Flask, request, jsonify
import cv2
import numpy as np
import base64
import tensorflow as tf
import firebase_admin
from firebase_admin import credentials, storage

app = Flask(__name__)

# Initialize Firebase Admin SDK
cred = credentials.Certificate("graphology-ibm-firebase-adminsdk-eod85-4a2d7a2ea4.json")
firebase_admin.initialize_app(cred, {
    'storageBucket': 'graphology-ibm.appspot.com'
})

# Path to your model file
model_path = 'model_96.6.h5'

# Download the model if it doesn't exist
if not os.path.exists(model_path):
    bucket = storage.bucket()
    blob = bucket.blob('model_96.6.h5')  # Corrected path
    blob.download_to_filename(model_path)

# Load the model
model = tf.keras.models.load_model(model_path)

@app.route('/predict', methods=['POST'])
def predict():
    try:
        request_data = request.get_json()
        image_data = request_data['image']
        
        # Ensure correct padding
        image_data += '=' * (len(image_data) % 4)
        image_data = image_data.replace(' ', '').replace('-', '+').replace('_', '/')
        image_bytes = base64.b64decode(image_data)
        image_np = np.frombuffer(image_bytes, np.uint8)
        image = cv2.imdecode(image_np, cv2.IMREAD_COLOR)

        if image is None:
            return jsonify({'error': 'Failed to load image'}), 400

        resized_image = tf.image.resize(tf.convert_to_tensor(image), (500, 500))
        normalized_image = resized_image / 255.0
        input_image = tf.expand_dims(normalized_image, 0)
        prediction = model.predict(input_image)

        predicted_class = np.argmax(prediction)
        if predicted_class == 1:
            result = 'This is a valid image'
        elif predicted_class == 0:
            result = 'Image is either of bad quality or not in English'
        else:
            result = 'Image is too zoomed, please retake the image'

        return jsonify({'result': result})
    except Exception as e:
        print(f"Error: {str(e)}")
        return jsonify({'error': 'Internal Server Error'}), 500

if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))
