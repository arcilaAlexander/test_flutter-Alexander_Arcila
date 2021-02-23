import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/models/news.dart';

class ApiService {
  String urlForApi(optionUrl) {
    switch (optionUrl) {
      case 1:
        // All articles about Tesla from the last month, sorted by recent first
        return 'http://newsapi.org/v2/everything?q=tesla&from=2021-02-23&sortBy=publishedAt&apiKey=6d0c846f3ab1474c9bfa773d98f25558';
      case 2:
        //Top business headlines in the US right now
        return 'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6d0c846f3ab1474c9bfa773d98f25558';
      case 3:
        //All articles mentioning Apple from yesterday, sorted by popular publishers first
        return 'http://newsapi.org/v2/everything?q=apple&from=2021-02-23&to=2021-02-11&sortBy=popularity&apiKey=6d0c846f3ab1474c9bfa773d98f25558';
      case 4:
        //Top headlines from TechCrunch right now
        return 'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=6d0c846f3ab1474c9bfa773d98f25558';
      case 5:
        // All articles published by the Wall Street Journal in the last 6 months, sorted by recent first
        return 'http://newsapi.org/v2/everything?domains=wsj.com&apiKey=6d0c846f3ab1474c9bfa773d98f25558';
    }
  }

  GetDio({@required int optionUrl}) async {
    var dio = Dio();

    //await = consume api antes de hacer otra accion
    Response response = await dio.get(urlForApi(optionUrl));
    //manejamso si reponde el api
    if (response.statusCode == 200) {
      return NewsApiModel.fromjson(response.data);
    } else {
      //lanzamso error
      print('Algo salio mal');
    }
  }
}
