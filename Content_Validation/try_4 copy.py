from flask import Flask, request, jsonify
import cv2
import numpy as np
import base64
import tensorflow as tf

app = Flask(__name__)

# Assuming `model` is your TensorFlow model
model_path = '/Users/khushbooshrivastava/Desktop/Flutter/IBM_APP/Phase_1/untitled folder/Content_Validation/model_96.6.h5'
model = tf.keras.models.load_model(model_path)


@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Get the image data from the request
        request_data = request.get_json()
        image_data = request_data['image']

        # Ensure correct padding
        image_data += '=' * (len(image_data) % 4)

        # Remove whitespaces
        image_data = image_data.replace(' ', '')

        # Replace URL-safe characters
        image_data = image_data.replace('-', '+').replace('_', '/')

        # Decode base64 string to bytes
        image_bytes = base64.b64decode(image_data)

        # Convert bytes to numpy array using np.frombuffer
        image_np = np.frombuffer(image_bytes, np.uint8)

        # Decode the image using cv2.imdecode
        image = cv2.imdecode(image_np, cv2.IMREAD_COLOR)

        # Check if the image is loaded successfully
        if image is None:
            return jsonify({'error': 'Failed to load image'}), 400

        # Perform your image processing or model prediction here
        # Resize the image
        resized_image = tf.image.resize(tf.convert_to_tensor(image), (500, 500))
        # Normalize the resized image (assuming your model expects values in [0, 1])
        normalized_image = resized_image / 255.0

        # Expand dimensions to match the model's input shape
        input_image = tf.expand_dims(normalized_image, 0)

       # Make the prediction
        prediction = model.predict(input_image)

        # Debug print statements
        print(f"Input image shape: {input_image.shape}")
        print(f"Prediction shape: {prediction.shape}")
        print(f"Prediction values: {prediction}")

        # Assuming prediction is a probability, you might want to get the class with maximum probability
        predicted_class = np.argmax(prediction)

        if predicted_class == 1:
            result = 'This is a valid image'
        elif predicted_class == 0:
            result = 'Image is either of bad quality or not in English'
        else:
            result = 'Image is too zoomed, please retake the image'

        return jsonify({'result': result})
    except Exception as e:
        # Log or handle the exception appropriately
        print(f"Error: {str(e)}")
        return jsonify({'error': 'Internal Server Error'}), 500

if __name__ == '__main__':
    app.run(debug=True)



# from keras.models import load_model
# model = load_model('models/model_96.6.h5')
# import tensorflow as tf
# import numpy as np
# import cv2
# image = cv2.imread("valid_test_3.jpg")
# resize = tf.image.resize(image, (500,500))
# np.expand_dims(resize, 0).shape
# value = model.predict(np.expand_dims(resize/255 , 0))
# prediction = np.argmax(value)
# if prediction ==1:
#     print('This is a valid image')
# elif prediction == 0:
#     print('Image is either of bad quality or not in english')
# else:
#     print('Image is too zoomed please retake the image')


# prediction = np.argmax(value)
# if prediction ==1:
#     print('This is a valid image')
# elif prediction == 0:
#     print('Image is either of bad quality or not in english')
# else:
#     print('Image is too zoomed please retake the image')

















# import base64
# import traceback
# from flask import Flask, request, jsonify
# import tensorflow as tf
# import numpy as np
# import cv2
# from keras.models import load_model

# app = Flask(__name__)
# model = tf.keras.models.load_model('/Users/khushbooshrivastava/Desktop/Flutter/IBM_APP/Content_Validation/97.5_per.h5')

# @app.route('/predict', methods=['POST'])
# def predict():
#     try:
#         # Assuming the image is sent as a base64-encoded string
#         # Get the image data from the request
#         request_data = request.get_json()
#         image_data = request_data['image']

#         # Ensure correct padding
#         image_data += '=' * (len(image_data) % 4)
#         # Remove whitespaces
#         image_data = image_data.replace(' ', '')

#         # Replace URL-safe characters
#         image_data = image_data.replace('-', '+').replace('_', '/')

#         # Decode base64 string to bytes
#         image_bytes = base64.b64decode(image_data)

#         # Convert bytes to numpy array using np.frombuffer
#         image_np = np.frombuffer(image_bytes, np.uint8)
        
#         # Decode the image using cv2.imdecode
#         image = cv2.imdecode(image_np, cv2.IMREAD_COLOR)
#         resize = tf.image.resize(tf.convert_to_tensor(image), (500, 500))
#         resized_image = np.expand_dims(resize / 255, 0)
#         value = model.predict(resized_image)

#         prediction = 'valid' if value[0, 0] > 0.5 else 'invalid'
#         return jsonify({'prediction': prediction})

#     except Exception as e:
#         # Log or print the exception details
#         print(f"Error: {str(e)}")
#         traceback.print_exc()  # Print the traceback

#         return jsonify({'error': 'Internal Server Error'}), 500  # Return a 500 status code

# if __name__ == '__main__':
#     app.run(debug=True)
