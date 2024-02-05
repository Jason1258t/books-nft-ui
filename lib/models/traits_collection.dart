class TraitsCollection {
  final int min_income;
  final int max_income;
  final int min_activities;
  final int max_activities;
  final int current_supply;
  final int total_supply;
  final int max_images;

  TraitsCollection.fromJson(Map<String, dynamic> json)
      : min_income = json['min_income'],
        max_income = json['max_income'],
        min_activities = json['min_activities'],
        max_activities = json['max_activities'],
        current_supply = json['current_supply'],
        total_supply = json['total_supply'],
        max_images = json['max_images'];
}
