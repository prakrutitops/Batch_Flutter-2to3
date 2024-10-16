import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../res/strings/strings.dart';
import '../model/api_result_model.dart';


abstract class ArticleRepository {
  Future<List<Articles>> getArticles();
}

class ArticleRepositoryImpl implements ArticleRepository {

  @override
  Future<List<Articles>> getArticles() async {
    var response = await http.get(Uri.parse(AppStrings.cricArticleUrl));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Articles>? articles = ApiResultModel.fromJson(data).articles;
      return articles!!;
    } else {
      throw Exception();
    }
  }

}