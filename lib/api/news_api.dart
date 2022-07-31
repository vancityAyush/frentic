import 'package:dio/dio.dart';
import 'package:frentic/api/apiresponse/news_response.dart';
import 'package:frentic/models/News.dart';

/**
 * Created by : Ayush Kumar
 * Created on : 29-07-2022
 */
class NewsApiManager {
  late Dio dio;
  final String apiKey = "YP6xrxQpyklZNtENJz8p9FpyYy8XL83R";

  NewsApiManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsmytra.com",
      ),
    );
    // getIt.registerSingleton<NewsApiManager>(this);
  }

  Future<List<News>> getNews(String type) async {
    try {
      final response = await dio.get("/newsapi/$type/", queryParameters: {
        "api_key": apiKey,
      });
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.data;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<News>> getFinanceNews() async {
    return getNews("/post");
  }

  Future<List<News>> getPoliticsNews() async {
    return getNews("/politics");
  }

  Future<List<News>> getLifeStyleNews() async {
    return getNews("/lifestyle");
  }

  Future<List<News>> getTechNews() async {
    return getNews("/tech");
  }

  Future<List<News>> getEntertainmentNews() async {
    return getNews("/entertainment");
  }

  Future<List<News>> getSportsNews() async {
    return getNews("/sports");
  }

  Future<List<News>> getTravelNews() async {
    return getNews("/travels");
  }
}
