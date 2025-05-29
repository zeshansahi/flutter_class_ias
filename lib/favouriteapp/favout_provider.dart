import 'package:flutter/foundation.dart';
import 'package:flutter_class_ias/favouriteapp/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavouritProvider extends ChangeNotifier {
  List<UserModel> userList = []; // Initialize as empty list instead of nullable

  Future<void> listApiCall() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      http.StreamedResponse response = await request.send();

      print("Request:: ${request}");
      print("ResponseCode:: ${response.statusCode}");

      if (response.statusCode == 200) {
        // Read the stream only once
        final data = await response.stream.bytesToString();
        // print("ResponseData:: $data");

        try {
          userList = parseUsers(data); // Direct assignment instead of addAll
          notifyListeners();
          // print("Api Called successfully - Parsed ${userList.length} items");
        } catch (e) {
          print("JSON Parsing Error: $e");
          userList = []; // Clear list on error
          notifyListeners();
        }
      } else if (response.statusCode == 401) {
        print("Session expired");
      } else {
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Network Error: $e");
    }
  }

  List<UserModel> parseUsers(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => UserModel.fromJson(json)).toList();
  }

  Future<void> addUserPostApiCall({userId, id, title, textBody}) async {
    try {
      // Create the request body
      final requestBody = {
        "userId": userId,
        "id": id,
        "title": title,
        "body": textBody
      };

      // Convert the body to JSON string
      final body = json.encode(requestBody);

      // Create POST request
      var request = http.Request(
        'POST',
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      request.headers['Content-Type'] = 'application/json; charset=UTF-8';
      request.body = body;

      http.StreamedResponse response = await request.send();

      print("Request:: ${request}");
      print("Request Body:: ${body}");
      print("ResponseCode:: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Read the response only once
        final data = await response.stream.bytesToString();
        print("ResponseData:: $data");

        try {
          // For POST, you might want to handle single object response
          var jsonData = jsonDecode(data);
          UserModel userModel = UserModel.fromJson(jsonData);
          print("object::${userModel.toString()}");
        } catch (e) {
          print("JSON Parsing Error: $e");
          userList = [];
          notifyListeners();
        }
      } else if (response.statusCode == 401) {
        print("Session expired");
      } else {
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Network Error: $e");
    }
  }
}
