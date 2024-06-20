import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oneone/Screens_ui/confirm_photo.dart';

class StackedCard extends StatelessWidget {
  const StackedCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        // Wrap with Material to provide a material design to the elevated buttons
        child: Stack(
          children: [
            Container(
              height: 250.0,
              child: Card(
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
                        'Handwriting Analysis',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '\nHelp you to analyse your handwiting.Open the camera to use the analysis',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Roboto',
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
                onPressed: () async {
                  final XFile? image = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    // You can customize further options here
                  );

                  if (image != null) {
                    // Navigate to Confirm_photo and pass the captured image
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Confirm_photo(imagePath: image.path),
                      ),
                    );
                  }
                },
                child:
                    Text('Take Photo', style: TextStyle(color: Colors.black)),
              ),
            ),
            Positioned(
              bottom: 45.0,
              right: 150.0,
              child: ElevatedButton(
                onPressed: () async {
                  final XFile? image = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    // You can customize further options here
                  );

                  if (image != null) {
                    // Navigate to Confirm_photo and pass the selected image
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Confirm_photo(imagePath: image.path),
                      ),
                    );
                  }
                },
                child:
                    Text('Open Gallery', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
