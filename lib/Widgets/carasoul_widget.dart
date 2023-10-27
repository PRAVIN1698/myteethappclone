import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myteethpractice/dummy/carasoul_data.dart'; // Make sure to import your data source correctly

class CarouselSliderNearby extends StatelessWidget {
  const CarouselSliderNearby({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int lengthindex = carasoulList.where((element) {
      return element.Cliniclication == 'Donvalley';
    }).length;

    print(lengthindex);

    final List<carasouldata> nearbyList = carasoulList
        .where((element) => element.Cliniclication == 'Donvalley')
        .toList();

    return CarouselSlider.builder(
      itemCount: lengthindex,
      options: CarouselOptions(
        initialPage: 2,
        viewportFraction: 0.3,
      ),
      itemBuilder: (context, index, realIndex) {
        final clinicData = nearbyList[index];

        return Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          //color: Color.fromARGB(255, 255, 255, 255),
          decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(25),
              color: Color.fromARGB(255, 255, 255, 255)),
          width: 900,
          //width: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: AssetImage(clinicData.imageUrl),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                clinicData.clinicname,
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
                  Text(clinicData.Cliniclication),
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
                  if (clinicData.clinicstatus == 'Closed')
                    Text(
                      clinicData.clinicstatus,
                      style: TextStyle(
                        color:
                            Color.fromARGB(255, 233, 15, 15).withOpacity(0.6),
                      ),
                    ),
                  if (clinicData.clinicstatus == 'Opened')
                    Text(
                      clinicData.clinicstatus,
                      style: TextStyle(
                        color:
                            Color.fromARGB(255, 27, 121, 40).withOpacity(0.6),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
