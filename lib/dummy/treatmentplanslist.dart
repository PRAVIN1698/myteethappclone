class treatmentplans {
  final String imageUrl;

  final String locationarea;

  final String clinincname;

  final String tratments;

  final DateTime date;

  final String visits;

  final String location;

  treatmentplans(
      {required this.locationarea,
      required this.clinincname,
      required this.imageUrl,
      required this.tratments,
      required this.visits,
      required this.date,
      required this.location});
}

final List<treatmentplans> treatmentplansList = [
  treatmentplans(
    locationarea: 'DonValley',
    clinincname: 'SimeElemenets',
    imageUrl: 'assets/images/teethlogo_1.jpg',
    tratments: 'Braclets and wiring',
    visits: '18',
    date: DateTime(2023, 10, 23),
    location: 'Seo, calforynyy , canada',
  ),
  treatmentplans(
    locationarea: 'DonValley',
    clinincname: 'Ortho4d',
    imageUrl: 'assets/images/teethlogo_2.jpg',
    tratments: 'Braclets and wiring',
    visits: '18',
    date: DateTime(2023, 10, 23),
    location: 'Seo, calforynyy , canada',
  ),
  treatmentplans(
    locationarea: 'DonValley',
    clinincname: 'SimeElemenets',
    imageUrl: 'assets/images/teethlogo_3.jpg',
    tratments: 'Braclets and wiring',
    visits: '18',
    date: DateTime(2023, 10, 23),
    location: 'Seo, calforynyy , canada',
  ),
  treatmentplans(
    locationarea: 'DonValley',
    clinincname: 'SimeElemenets',
    imageUrl: 'assets/images/teethlogo_4.jpg',
    tratments: 'Braclets and wiring',
    visits: '18',
    date: DateTime(2023, 10, 23),
    location: 'Seo, calforynyy , canada',
  ),
];
