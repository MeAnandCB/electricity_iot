import 'package:hive/hive.dart';

part 'current_data.g.dart';

@HiveType(typeId: 1)
class CurrentData {
  CurrentData(
      {required this.current,
      required this.bill_amount,
      required this.date,
      required this.time});
  @HiveField(0)
  double current;

  @HiveField(1)
  int bill_amount;

  @HiveField(2)
  String date;

  @HiveField(3)
  String time;
}
