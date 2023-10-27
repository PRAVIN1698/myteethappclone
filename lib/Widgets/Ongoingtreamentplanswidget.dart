import 'package:flutter/material.dart';
import 'package:myteethpractice/Provider/tratmentplanprovider.dart';
import 'package:myteethpractice/Widgets/payment_widget.dart';
import 'package:provider/provider.dart';

class Ongoingtreatmentplanwidget extends StatefulWidget {
  const Ongoingtreatmentplanwidget({super.key});

  @override
  State<Ongoingtreatmentplanwidget> createState() =>
      _OngoingtreatmentplanwidgetState();
}

class _OngoingtreatmentplanwidgetState
    extends State<Ongoingtreatmentplanwidget> {
  @override
  Widget build(BuildContext context) {
    print('hello from Ongoingtreatmentplanwidget');

    final ongoingplanslistt =
        Provider.of<tratementprovider>(context, listen: false);

    return Consumer<tratementprovider>(
      builder: (context, tratementprovider, child) {
        final ongoingPlans = tratementprovider.ongoingPlans;

        print(ongoingPlans.length);

        if (ongoingPlans.length == null) {
          return Scaffold(
            body: Center(child: Text('No data plans')),
          );
        } else {
          return ListView.builder(
            itemCount: ongoingPlans.length,
            itemBuilder: (context, index) {
              final data = ongoingPlans[index];
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
                        title: Text(data.clinincname),
                        subtitle: Text(data.locationarea),
                        onTap: () {},
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => paymentwidget(
                                                paymentindex: index,
                                              )));
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
                                    'Pay Now',
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
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
