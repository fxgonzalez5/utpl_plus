import 'package:http/http.dart' as http;
import 'package:utpl_plus/models/models.dart';

class NewsProvider {
  final _url = 'appmovil.utpl.edu.ec:8080';

  Future<List<Article>> getNews({int page = 1}) async {
    final url = Uri.https(_url, '/v1/news/all', {'page': '$page'});
    final resp = await http.get(url);
    return News.fromJson(resp.body).data;
  }
}
