import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myteethpractice/Widgets/carasoul_widget.dart';
import 'package:myteethpractice/Widgets/carasoulallplaces.dart';
import 'package:myteethpractice/Widgets/smallcarassoulwidget.dart';
import 'package:myteethpractice/dummy/carasoul_data.dart';
import 'package:myteethpractice/screens/Treatmentplans/Treatmentsplans.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreen();
}

class _homescreen extends State<homescreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('HomeScreen entered');

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            expandedHeight: 450.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              //title: Text("Nearby Places"),
              background: Container(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(28, 112, 168, 4),
                            Color.fromRGBO(2, 166, 138, 3)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        'Nearby Devices',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      //width: double.infinity,
                      //height: double.infinity,
                      child: const CarouselSliderNearby(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  //width: double.infinity,
                  height: 120,
                  color: Color.fromARGB(245, 248, 248, 248),
                  child: const visitscarasouol(),
                  //width: double infinity,
                ),
                Container(
                  //width: double.infinity,
                  height: 900,
                  color: Color.fromARGB(245, 248, 248, 248),
                  child: const CarouselSliderallplaces(),
                  //width: double infinity,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information),
            label: 'Home',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int value) {
    setState(() {
      _currentIndex = value;
    });

    switch (_currentIndex) {
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => treatmentplans()));
        break;
      default:
        treatmentplans();
    }

    // Optionally, you can perform additional actions based on the tapped index.
    // For example, if you want to navigate to a specific page when an item is tapped, you can use Navigator.
    // For example:
    // if (index == 1) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => YourPage()));
    // }
  }
}
