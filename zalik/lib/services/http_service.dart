import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile_labs/data/config.dart';
import 'package:mobile_labs/data/response.dart';

class HttpService {
  Future<UserResponse> getUser(String name) async {
    try {
      var responce = await get(Uri.parse("${Config.url}?name=$name"));
      if (responce.statusCode == 200) {
        return UserResponse.fromJson(jsonDecode(responce.body));
      } else {
        return UserResponse(0, 0, 'Failed');
      }
    } catch (e) {
      return UserResponse(0, 0, 'Failed');
    }
  }
}
