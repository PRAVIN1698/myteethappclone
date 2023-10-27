import 'package:flutter/material.dart';
import 'package:myteethpractice/dummy/treatmentplanslist.dart';

class treatmentplans extends StatefulWidget {
  const treatmentplans({super.key});

  @override
  State<treatmentplans> createState() => _treatmentplansState();
}

class _treatmentplansState extends State<treatmentplans> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: treatmentplansList.length,
          itemBuilder: (context, index) {
            Card(
                elevation: 10,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Card Title'),
                      subtitle: Text('Subtitle for the Card'),
                    ),
                    Image.network('https://example.com/image.png'),
                    ButtonBar(
                      children: [
                        TextButton(
                          onPressed: () {
                            // Handle button press
                          },
                          child: Text('Action'),
                        ),
                      ],
                    ),
                  ],
                ));
          }),
    );
  }
}
