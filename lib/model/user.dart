import 'package:api_practice/model/user_dob.dart';
import 'package:api_practice/model/user_location.dart';
import 'package:api_practice/model/user_name.dart';
import 'package:api_practice/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
  });

  factory User.fromMap(Map<String, dynamic> e) {

    // user name
    final name = UserName.fromMap(e['name']);

    // user DOB
    final dob = UserDob.fromMap(e['dob']);

    // user Location
    final location = UserLocation.fromMap(e['location']);

    // user Picture
    final picture = UserPicture.fromMap(e['picture']);

    return User(
      gender: e['gender'],
      email:  e['email'],
      phone:  e['phone'],
      cell:   e['cell'],
      nat:    e['nat'],
      name: name,
      dob: dob,
      location: location,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }

}