import 'dart:convert';
import 'package:http/http.dart' as http;

class UserApi {
  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse(
        'https://brotherlike-navies.000webhostapp.com/people/people.php'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
