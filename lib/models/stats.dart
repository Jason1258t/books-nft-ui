class UserStats {
  Stats stats;
  Indicators indicators;

  UserStats({required this.stats, required this.indicators});
}

class Stats {
  final int intelligence;
  final int luck;
  final int strength;
  final double energy;

  Stats(
      {required this.energy,
      required this.intelligence,
      required this.luck,
      required this.strength});

  Stats.fromJson(Map<String, dynamic> json)
      : intelligence = json['intelligenceProperty'],
        luck = json['luckProperty'],
        strength = json['strengthProperty'],
        energy = json['energyProperty'];
}

class Indicators {
  final double mixed;
  final int strength;
  final double energy;

  Indicators(this.mixed, this.strength, this.energy);

  Indicators.fromJson(Map<String, dynamic> json)
      : mixed = json['multiplierIndicator'],
        strength = json['strengthIndicator'],
        energy = json['energyIndicator'];
}
