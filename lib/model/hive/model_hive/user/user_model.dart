import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class User {
  User({required this.name, required this.email, required this.password});
  @HiveField(0)
  String name;
  @HiveField(1)
  String email;
  @HiveField(3)
  String password;
}
