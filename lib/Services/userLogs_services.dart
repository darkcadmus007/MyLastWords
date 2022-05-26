import 'dart:convert';

import 'package:mylastwords/Background/tracker.dart';
import 'package:mylastwords/Services/user_service.dart';
import 'package:mylastwords/constants.dart';
import 'package:mylastwords/models/api_response.dart';
import 'package:mylastwords/models/note.dart';
import 'package:http/http.dart' as http;
import 'package:mylastwords/models/user_logs.dart';
import 'package:shared_preferences/shared_preferences.dart';

//addlogs
Future<ApiResponse> addUserLogCall(
    DateTime startTime, DateTime endTime, String location) async {
  ApiResponse apiResponse = ApiResponse();
  String token = await getToken();
  int id = await getuserId();

  try {
    final response = await http.post(Uri.parse(addUserLogURL),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode({
          'user_id': id,
          'starttime': startTime.toIso8601String(),
          'endtime': endTime.toIso8601String(),
          'location': location
        }));
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = UserLogModel.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)[0]];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = "Something went wrong";
    }
  } catch (e) {
    apiResponse.error = '$e' + '. Server Error.';
  }

  return apiResponse;
}
