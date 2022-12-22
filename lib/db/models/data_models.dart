import 'package:hive/hive.dart';

part 'data_models.g.dart';


@HiveType(typeId: 1)

class UserModel {
  @HiveField(0)
  String? id;
  
  @HiveField(1)
  final String email;
  
  @HiveField(2)
  final String password;
  

  UserModel({required this.email, required this.password}) {
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}