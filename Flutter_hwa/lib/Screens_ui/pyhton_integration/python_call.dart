import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // yaml --> http: ^0.13.3
import 'package:flutter/services.dart' show ByteData, rootBundle;

class YourButtonScreen extends StatefulWidget {
  @override
  _YourButtonScreenState createState() => _YourButtonScreenState();
}

class _YourButtonScreenState extends State<YourButtonScreen> {
  String predictionResult = '';

  Future<void> sendImageToServer() async {
    // Replace the URL with your Flask server URL
    final String apiUrl = 'http://127.0.0.1:5000/predict';

    //converting the png image into base64_encoded_image_data
    // Replace 'path/to/your/image.png' with the actual path to your PNG image file
     String imagePath = 'assets/test_2.png';
    //  String imagePath = 'assets/portrait-white-man-isolated_53876-40306.png';

    String base64Image = ''; // Declare the variable outside the try block

    try {
      // Read the PNG image file as bytes using rootBundle
      List<int> imageBytes = await rootBundle
          .load(imagePath)
          .then((ByteData data) => data.buffer.asUint8List());

      // Encode the image bytes to base64
      base64Image = base64Encode(imageBytes);

      // Print or use the base64-encoded image string as needed
      print('Base64-encoded image data:\n$base64Image');
    } catch (e) {
      print('Error reading or encoding the image: $e');
    }

// Now you can use the base64Image variable outside the try block
    final String imageBase64 = base64Image;

    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'image': imageBase64}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          predictionResult = data['result'];
        });
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                sendImageToServer();
              },
              child: Text('Run Python Code'),
            ),
            SizedBox(height: 20),
            Text('Prediction Result: $predictionResult'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: YourButtonScreen(),
  ));
}
