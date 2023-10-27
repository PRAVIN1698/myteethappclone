import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myteethpractice/Provider/tratmentplanprovider.dart';
import 'package:myteethpractice/screens/Treatmentplans/Treatmentsplans.dart';
import 'package:provider/provider.dart';

class visitscarasouol extends StatefulWidget {
  const visitscarasouol({super.key});

  @override
  State<visitscarasouol> createState() => _visitscarasouolState();
}

class _visitscarasouolState extends State<visitscarasouol> {
  @override
  Widget build(BuildContext context) {
    final treatmentProvider =
        Provider.of<tratementprovider>(context, listen: true);

    List<Color> colorsList = [
      const Color.fromARGB(255, 187, 120, 120),
      Color.fromARGB(255, 176, 196, 87),
      Color.fromARGB(255, 182, 151, 84),
    ];

    // Assuming that `ongoingPlans` is a List of treatment plans
    final List visitsPlans =
        treatmentProvider.smallcarasoulplans?.toList() ?? [];

    return Consumer<tratementprovider>(
      builder: (context, treatmentPlanProvider, child) {
        return Container(
          child: ListView.builder(
            itemCount: visitsPlans.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final visitPlan = visitsPlans[index];

              final colorIndex = index % colorsList.length;
              final backgroundColor = colorsList[colorIndex];

              // You can access properties of visitPlan here and create your custom UI
              return Container(
                width: 300,
                height: 60,
                color: backgroundColor, // Set the background color
                child: Column(
                  children: [
                    ListTile(
                      selectedColor: Color.fromARGB(255, 255, 255, 255),
                      leading: ClipOval(
                        child: Image.asset(visitPlan.imageUrl,
                            width: 60, height: 60),
                      ),
                      title: Text(visitPlan.clinincname),
                      subtitle: Text(visitPlan.locationarea),
                      // Add more widgets to display other properties
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month),
                          Text(visitPlan.locationarea),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
