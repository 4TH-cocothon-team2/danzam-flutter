class CaffeineItem {
  final String name;
  final int itemCount;
  final int volume;
  final int caffeine;
  final String eatDate;
  final String eatTime;

  const CaffeineItem({
    required this.name,
    required this.itemCount,
    required this.volume,
    required this.caffeine,
    required this.eatDate,
    required this.eatTime,
  });

  factory CaffeineItem.fromMap(Map<String, dynamic> map) {
    return CaffeineItem(
      name: map['name'],
      itemCount: map['itemCount'],
      volume: map['volume'],
      caffeine: map['caffeine'],
      eatDate: map['eatDate'],
      eatTime: map['eatTime'],
    );
  }
}
