import 'dart:convert';
import 'package:aspins_test_app/screens/home/model/user.dart';
import 'package:http/http.dart' as http;

class UsersApi {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://api.npoint.io/7fb29e8eda082141a9d5'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> usersJson = data['items'];
      return usersJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Не удалось загрузить данные');
    }
  }
}
