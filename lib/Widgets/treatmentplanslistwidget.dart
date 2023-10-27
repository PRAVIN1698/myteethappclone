import 'package:flutter/material.dart';
import 'package:myteethpractice/Provider/tratmentplanprovider.dart';
import 'package:myteethpractice/Widgets/Ongoingtreamentplanswidget.dart';
import 'package:myteethpractice/dummy/treatmentplanslist.dart';
import 'package:provider/provider.dart';

class treatmentplanswidget extends StatefulWidget {
  const treatmentplanswidget({super.key});

  @override
  State<treatmentplanswidget> createState() => _treatmentplanswidgetState();
}

class _treatmentplanswidgetState extends State<treatmentplanswidget> {
  void dismissAndNavigateToOngoing(int index, BuildContext context) {
    final treatmentPlanprovider =
        Provider.of<tratementprovider>(context, listen: false);

    if (index >= 0 && index < treatmentplansList.length) {
      final selectedPlan = treatmentplansList[index];

      // Perform the necessary actions, e.g., add the plan, navigate to ongoing, and notify listeners.
      treatmentPlanprovider.ongoingacceptplan(index);
      treatmentPlanprovider.navigateToOngoingPlans();

      // Notify listeners to update the UI.
      treatmentPlanprovider.notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      child: ListView.builder(
        itemCount: treatmentplansList.length,
        itemBuilder: (context, index) {
          final data = treatmentplansList[index];
          return Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: Card(
                  margin: EdgeInsets.all(25),
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    children: [
                      ListTile(
                        selectedColor: Color.fromARGB(255, 255, 255, 255),
                        leading: ClipOval(
                          child:
                              Image.asset(data.imageUrl, width: 60, height: 60),
                        ),

                        // Display the image as an icon
                        title: Text(data
                            .clinincname), // Display clinincname as the title
                        subtitle: Text(data.locationarea),

                        onTap: () {},

                        // Display location as the subtitle
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 30, 20, 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.account_box_sharp),
                                Text(
                                  'Consultation',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Text(
                                  'Date: ${data.date.toString()}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Text(
                                  'Visits: ${data.visits}',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Text(
                                  data.location,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                onPressed: () {
                                  dismissAndNavigateToOngoing(index, context);

                                  final treatmentPlanprovider =
                                      Provider.of<tratementprovider>(context,
                                          listen: false);

                                  treatmentplansList
                                      .remove(treatmentplansList[index]);
                                  treatmentPlanprovider.notifyListeners();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 20, 153, 31),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(90, 0, 38, 253),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: const Text(
                                    'Accept',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )));
        },
      ),
    );
  }
}
