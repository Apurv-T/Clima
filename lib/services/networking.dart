import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    Response response = await get(url);
    return response;
  }
}
