import 'package:flutter/material.dart';
import 'package:myteethpractice/Provider/tratmentplanprovider.dart';
import 'package:myteethpractice/dummy/treatmentplanslist.dart';
import 'package:provider/provider.dart';

class paymentwidget extends StatefulWidget {
  const paymentwidget({required this.paymentindex, Key? key}) : super(key: key);

  final int paymentindex;

  @override
  State<paymentwidget> createState() => _paymentwidgetState();
}

class _paymentwidgetState extends State<paymentwidget> {
  late final data;

  @override
  void initState() {
    super.initState();

    final ongoingplanslistt =
        Provider.of<tratementprovider>(context, listen: false);

    data = ongoingplanslistt.ongoingPlans[widget.paymentindex];

    print('payemnet index : $data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              'Payments',
              style: TextStyle(color: Colors.white),
            ),
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(28, 112, 168, 4),
                            Color.fromRGBO(2, 166, 138, 3),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // You can add your payment widget here
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  //height: 40,
                  child: ListTile(
                    selectedColor: Color.fromARGB(255, 255, 255, 255),
                    leading: Image.asset(data.imageUrl, width: 100, height: 50),
                    title: Text(data.clinincname),
                    subtitle: Text(data.locationarea),
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
                  child: const Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.calendar_month),
                        title: Text(
                          'Brackets & Wiring',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_month),
                        title: Text(
                          'November 18 2020',
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: const Card(

                    
                      



                  ),
                )

                // Additional content can be added here
              ],
            ),
          )
        ],
      ),
    );
  }
}
