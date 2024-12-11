import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user.dart';

class UserApi{
  static Future<List<User>> fetchUser() async {
    print('fetch user called');
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();
    return users;
  }
}