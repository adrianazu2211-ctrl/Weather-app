import 'dart:convert';

import 'package:weatherapp/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserMockapiService {
  final String baseUrl = "https://68cedf266dc3f35077803c79.mockapi.io/api/v1";

  // GET -> obtener datos
  Future<List<UserModel>> getUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception("Error al cargar los usuarios");
    }
  }

  // POST -> crear datos
  Future<UserModel> createUser(UserModel user) async {
    final reponse = await http.post(
      Uri.parse("$baseUrl/users/"),
      body: jsonEncode(user.toJson()),
      headers: {"Content-Type": "application/json"},
    );

    if (reponse.statusCode == 201) {
      print(reponse.body);
      return UserModel.fromJson(jsonDecode(reponse.body));
    } else {
      throw Exception(
        "Errore ${reponse.statusCode}  - ${reponse.body.toString()}",
      );
    }
  }

  // PUT -> actualizar datos completos
  Future<UserModel?> updateUser(UserModel user) async {
    final response = await http.put(
      Uri.parse("$baseUrl/users/${user.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );
    try {
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("error: $e");
    }
  }

  // DELETE -> eliminar datos
  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/users/$id"));
    if (response.statusCode != 200) {
      throw Exception(response);
    }
  }
}
