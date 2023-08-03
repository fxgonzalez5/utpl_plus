import 'package:http/http.dart' as http;
import 'package:utpl_plus/models/models.dart';

class CineForumProvider {
  final _url = 'appmovil.utpl.edu.ec:8080';

  Future<List<Information>> getCineForum({int page = 1}) async {
    final url = Uri.https(_url, '/v2/library/benjamin/cine/forum/all', {'page': '$page'});
    final resp = await http.get(url);
    return CineForum.fromJson(resp.body).data;
  }
}
