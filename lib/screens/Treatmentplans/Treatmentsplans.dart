import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myteethpractice/Provider/tratmentplanprovider.dart';
import 'package:myteethpractice/Widgets/Ongoingtreamentplanswidget.dart';
import 'package:myteethpractice/Widgets/treatmentplanslistwidget.dart';
import 'package:myteethpractice/screens/home/homescreen.dart';
import 'package:provider/provider.dart';

class treatmentplans extends StatefulWidget {
  const treatmentplans({super.key});

  @override
  State<treatmentplans> createState() => _treatmentplansState();
}

class _treatmentplansState extends State<treatmentplans> {
  static const List<Widget> fruits = <Widget>[
    Text('Ongoing'),
    Text('Appoinments'),
    Text('Orange'),
    Text('Canceled'),
  ];
  bool vertical = false;

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final treatmentPlanprovider =
        Provider.of<tratementprovider>(context, listen: false);

    final List<bool> _selectedFruits = <bool>[
      treatmentPlanprovider.planschanged == 'Ongoingplans',
      treatmentPlanprovider.planschanged == 'treatmentplans',
      false,
      false,
    ];

    String planschanged = treatmentPlanprovider.planschanged;
    selectedTabIndex = planschanged == 'treatmentplans' ? 0 : 1;

    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar.medium(
          expandedHeight: 320.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(28, 112, 168, 4),
                            Color.fromRGBO(2, 166, 138, 3)
                          ],
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: ToggleButtons(
                          direction: vertical ? Axis.vertical : Axis.horizontal,

                          onPressed: (int index) {
                            setState(() {
                              // The button that is tapped is set to true, and the others to false.
                              for (int i = 0; i < _selectedFruits.length; i++) {
                                _selectedFruits[i] = i == index;
                              }
                            });

                            selectedTabIndex = index;
                            switch (index) {
                              case 0:
                                treatmentPlanprovider.navigateToOngoingPlans();

                                break;
                              case 1:
                                treatmentPlanprovider
                                    .navigateToTreatmentPlans();

                                break;
                              // Add more cases for other buttons if needed
                            }

                            //final selectedWidget = navigationMap[index];
                          },

                          borderRadius:
                              const BorderRadius.all(Radius.circular(2)),
                          selectedBorderColor:
                              Color.fromARGB(255, 255, 255, 255),
                          selectedColor:
                              const Color.fromARGB(255, 253, 253, 253),
                          fillColor: Color.fromARGB(255, 231, 231, 231),
                          //color: const Color.fromARGB(255, 248, 248, 248),
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 80.0,
                          ),
                          isSelected: _selectedFruits,
                          children: fruits,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )),
      SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
              height: 900,
              child: Consumer<tratementprovider>(
                builder: (context, treatmentPlanprovider, child) {
                  String planschanged = treatmentPlanprovider.planschanged;

                  selectedTabIndex = planschanged == 'treatmentplans' ? 0 : 1;

                  // Set _selectedFruits[0] to true if planschanged is 'Ongoingplans'

                  // Your UI code based on planschanged

                  if (planschanged == 'treatmentplans') {
                    _selectedFruits[1] = true;
                    _selectedFruits[0] = false;
                    return const treatmentplanswidget();
                  } else {
                    _selectedFruits[1] = false;
                    _selectedFruits[0] = true;
                    return const Ongoingtreatmentplanwidget();
                  }
                },
              ),
            )
          ],
        ),
      )
    ]));
  }
}
