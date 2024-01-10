import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:interview_task/model/search_model.dart';
import 'package:interview_task/utiles/api_route.dart';

class SearchService {
  static Future<SearchModel?> getSearchData() async {
    try {
      final response = await http.get(Uri.parse(ApiRoute.searchLink));
      if (response.statusCode == 200) {
        return searchModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }
}
