import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:interview_task/utiles/api_route.dart';

class Service {
  static Future<http.Response?> getItems() async {
    try {
      final response = await http.get(Uri.parse(ApiRoute.homeLink));
      return response;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }
}
