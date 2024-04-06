import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'Analysis_screen.dart';
import 'Profile_screen.dart';
import 'settings.dart';

class Confirm_photo extends StatefulWidget {
  final String imagePath;

  const Confirm_photo({Key? key, required this.imagePath}) : super(key: key);

  @override
  _Confirm_photoState createState() => _Confirm_photoState();
}

class _Confirm_photoState extends State<Confirm_photo> {
  String predictionResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grapho Insights',
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => settings()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          // Display captured image
          Container(
            height: 250,
            child: Image.file(
              File(widget.imagePath),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(
            height: 100,
          ),

          // CARD VIEW
          Container(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Container(
                    height: 250.0,
                    child: Card(
                      color: Color.fromRGBO(144, 224, 239, 1),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Send to Analyse',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Help you to analyse your handwiting.Open the camera to use the analysis',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Roboto',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 45.0,
                    right: 16.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // RUNS PYTHON CODE HERE :
                        sendImageToServer();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Analysis_screen(predictionResult: predictionResult)),
                        );
                      },
                      child: Text(
                        'Analyse',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 45.0,
                    right: 130.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Take Again',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          //Text('Prediction Result: $predictionResult'),
        ],
      ),
    );
  }

  Future<void> sendImageToServer() async {
    // Replace the URL with your Flask server URL
    final String apiUrl = 'http://127.0.0.1:5000/predict';

    String base64Image = '';

    try {
      // Read the PNG image file as bytes using rootBundle
      List<int> imageBytes = await rootBundle
          .load(widget.imagePath)
          .then((ByteData data) => data.buffer.asUint8List());

      // Encode the image bytes to base64
      base64Image = base64Encode(imageBytes);

      // Print or use the base64-encoded image string as needed
      print('Base64-encoded image data:\n$base64Image');
    } catch (e) {
      print('Error reading or encoding the image: $e');
    }

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
}
