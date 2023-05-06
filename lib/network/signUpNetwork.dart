import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(
    String name, String phoneNumber, String email, String password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String name;
  final String phoneNumber;
  final String email;
  final String password;

  const Album(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.password});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
    );
  }
}

class GetSignUpUserData {
  Future fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/users'));
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      //Data.fromJson(json.decode(response.body));
    } else
      throw Exception('Failed to load');
  }
}
