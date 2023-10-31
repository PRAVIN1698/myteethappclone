import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myteethpractice/Provider/tratmentplanprovider.dart';
import 'package:myteethpractice/Widgets/carasoul_widget.dart';
import 'package:myteethpractice/Widgets/carasoulallplaces.dart';
import 'package:myteethpractice/Widgets/smallcarassoulwidget.dart';
import 'package:myteethpractice/dummy/carasoul_data.dart';
import 'package:myteethpractice/screens/Treatmentplans/Treatmentsplans.dart';
import 'package:myteethpractice/screens/auth/Authservice.dart';
import 'package:myteethpractice/screens/auth/Authservice.dart';
import 'package:provider/provider.dart';

final _firebase = FirebaseAuth.instance;

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreen();
}

class _homescreen extends State<homescreen> {
  final ScrollController _scrollController = ScrollController();

  String userData = ''; // Initialize a variable to store the Firestore data
  late User? userimage;
  String _username = '';
  int _currentIndex = 0;

  final userusername = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    super.initState();
    userimage = FirebaseAuth.instance.currentUser;

    if (userimage != null) {
      final Storageref = FirebaseStorage.instance
          .ref()
          .child('user_images')
          .child('${userimage!.uid}.jpg');
      fetchUserData();
    }

    fetchUsername();
  }

  Future<void> fetchUsername() async {
    final userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(userimage!.uid); // Replace with the actual document ID

    try {
      final userDataSnapshot = await userDoc.get();
      if (userDataSnapshot.exists) {
        _username = userDataSnapshot.get('username');
        print('Username: $_username');
      }
    } catch (e) {
      print('Error fetching username: $e');
    }
  }

  Future<void> fetchUserData() async {
    if (userimage == null) {
      return;
    }

    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(userimage!.uid);

    try {
      final userDataSnapshot = await userDoc.get();
      if (userDataSnapshot.exists) {
        final yourData = userDataSnapshot.get('image_url');
        setState(() {
          userData = yourData;
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationbacktoauth =
        Provider.of<AuthService>(context, listen: false);

    final Authenticateduser = FirebaseAuth.instance.currentUser!;

    print('HomeScreen entered');

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.large(
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
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                  onPressed: () {
                                    navigationbacktoauth.signOut();
                                  },
                                  icon: Icon(Icons.arrow_back))),
                          Align(
                            child: Container(
                              margin: EdgeInsets.only(left: 50),
                              alignment: Alignment.center,
                              width: double
                                  .infinity, // Set the width to your desired size
                              height: 50, // Set the height to your desired size
                              child: ListTile(
                                leading: userData.isNotEmpty
                                    ? ClipOval(
                                        child: Image.network(userData),
                                      )
                                    : Container(), // An empty container if userData is empty
                                title: Text('Welcome $_username',
                                    style: TextStyle(color: Colors.white)),
                                subtitle: const Text(
                                  'How are you!',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: const Text(
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
