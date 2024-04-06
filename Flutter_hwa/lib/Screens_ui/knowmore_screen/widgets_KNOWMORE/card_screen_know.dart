import 'package:flutter/material.dart';
import 'package:oneone/Screens_ui/HomeScreen/Home_screen.dart';

class card_knowmore_screen extends StatelessWidget {
  const card_knowmore_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Container(
            // color: Color.fromRGBO(3, 4, 94, 1),
            height: 550.0,
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
                      'Graphology',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                        'Graphology, inference of character from a person’s handwriting. The theory underlying graphology is that handwriting is an expression of personality; hence, a systematic analysis of the way words and letters are formed can reveal traits of personality. Graphologists note such elements as the size of individual letters and the degree and regularity of slanting, ornamentation, angularity, and curvature. Other basic considerations are the general appearance and impression of the writing, the pressure of upward and downward strokes, and the smoothness of the writing. For example, analytic graphologists interpret large handwriting as a sign of ambition and small handwriting as a sign of pedantry. Graphologists have cautioned that the validity of handwriting analysis can be subverted by such considerations as myopia and the loss of motor control. In general, the scientific basis for graphological interpretations of personality is questionable.'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            // top: 30,
            bottom: 30.0,
            right: 16.0,
            child: ElevatedButton(
              //style: ButtonStyle( ),
              onPressed: () {
                // Add your button's functionality here
                Navigator.pop(
                  context,
                );

                print('Button pressed');
              },
              child: Text(
                'Try now',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
