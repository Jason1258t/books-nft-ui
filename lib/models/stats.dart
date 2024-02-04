class UserStats {
  Stats stats;
  Indicators indicators;
  int lvl;

  UserStats({required this.stats, required this.indicators, required this.lvl});
}

class Stats {
  final int intelligence;
  final int luck;
  final int strength;
  final int energy;

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

  Stats.zero()
      : intelligence = 0,
        luck = 0,
        strength = 0,
        energy = 0;
}

class Indicators {
  final int mixed;
  final int strength;
  final int current_energybar;
  final int total_energybar;
  final int coin_balance;

  Indicators(this.mixed, this.strength, this.current_energybar,
      this.total_energybar, this.coin_balance);

  Indicators.fromJson(Map<String, dynamic> json)
      : mixed = json['multiplier'],
        strength = json['strengthIndicator'],
        current_energybar = json['current_energybar'],
        total_energybar = json['total_energybar'],
        coin_balance = json['coin_balance'];
}
