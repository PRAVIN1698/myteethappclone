import 'package:flutter/material.dart';
import 'package:myteethpractice/dummy/treatmentplanslist.dart';

class tratementprovider extends ChangeNotifier {
  int? number;

  List<treatmentplans> ongoingPlans = [];

  List<treatmentplans> smallcarasoulplans = [];

  String planschanged = 'treatmentplans';
  notifyListeners();

  void ongoingacceptplan(int index) {
    if (index >= 0 && index < treatmentplansList.length) {
      final selectedPlan = treatmentplansList[index];
      final selectedPlanimageee = treatmentplansList[index].imageUrl;
      print('provider ongoingplans $selectedPlan');
      print('provider ongoingplans $selectedPlanimageee');
      ongoingPlans.add(selectedPlan); // Add the selected plan to ongoingPlans
      notifyListeners();
      smallcarasoulplans =
          ongoingPlans; // Update smallcarasoulplans based on ongoingPlans
      notifyListeners();
    }
  }

  void navigateToTreatmentPlans() {
    planschanged = 'treatmentplans';
    notifyListeners();
  }

  void navigateToOngoingPlans() {
    planschanged = 'Ongoingplans';
    notifyListeners();
  }

  void removeelementfromlist(int index) {
    if (index >= 0 && index < treatmentplansList.length) {
      final indddex = treatmentplansList[index];

      treatmentplansList.remove(treatmentplansList[index]);
      // Add the selected plan to ongoingPlans
      notifyListeners();
    }
  }
}
