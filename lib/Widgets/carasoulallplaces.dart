import 'package:flutter/material.dart';
import 'package:myteethpractice/Provider/CarasoulDataNotifier.dart';
import 'package:myteethpractice/dummy/carasoul_data.dart';
import 'package:provider/provider.dart';

class CarouselSliderallplaces extends StatelessWidget {
  const CarouselSliderallplaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: carasoulList.length,
      itemBuilder: (context, index) {
        // Create a list of 3 items per row
        List<carasouldata> rowItems = [];
        for (int i = 0; i < 3 && index + i < carasoulList.length; i++) {
          final data = carasoulList.elementAt(index + i);
          rowItems.add(data);
        }

        return Wrap(
          children: rowItems.map((data) {
            return Container(
                width: MediaQuery.of(context).size.width /
                    3, // Divide the screen width into 3 columns
                padding: EdgeInsets.all(8),
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(data.imageUrl,
                          width: 100, height: 100, fit: BoxFit.cover),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.clinicname,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                          ),
                          Text(data.Cliniclication),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.open_in_browser,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
          }).toList(),
        );
      },
    );
  }
}
