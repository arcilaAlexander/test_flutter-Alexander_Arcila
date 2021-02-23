// statelesswidget cuando la vista es estatica no cambia
// statefulwidget cuanod la vista es dinamica y cambia como mensajes de alerta - evitar usarlos mucho por que recosntruye la aplicacion
// siempre se crea primero stateful widget - contenido dinamico
// se puede crear stalleswidget
// ambas estan atadas a Statemanagment -> implementa provider
// Riverpod (provider 2.0)
// BlocLibrary.dev
//permite adminsitrar arquitectura para darle orden

import 'package:flutter/material.dart';
import 'package:flutter_app1/data/news_repository.dart';
import 'package:flutter_app1/presenter/build_view.dart';
import 'package:flutter_app1/utils/styles.dart';
import 'package:flutter_app1/view/widgets/new_card-backup.dart';
import 'package:flutter_app1/models/news.dart';
import 'package:flutter_app1/view/widgets/drawer_option.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int intNews = 1;

  String viewName = 'NewsList';
  static const drawerOptions = <Map<String, dynamic>>[
    {
      'value': 1,
      'text':
          'All articles about Tesla from the last month, sorted by recent first'
    },
    {'value': 2, 'text': 'Top business headlines in the US right now'},
    {
      'value': 3,
      'text':
          'All articles mentioning Apple from yesterday, sorted by popular publishers first'
    },
    {'value': 4, 'text': 'Top headlines from TechCrunch right now'},
    {
      'value': 5,
      'text':
          'All articles published by the Wall Street Journal in the last 6 months, sorted by recent first'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          "News",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      drawer: Drawer(
        //Despliega la seccion del menu
        child: Column(
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Image.network(
                  'https://bit.institute/images/Instituto-Cursos-Programacion.png'),
            )),
            ...drawerOptions
                .map((option) => DrawerOption(
                      text: option['text'],
                      onTap: () {
                        setState(() {
                          intNews = option['value'];
                          Navigator.pop(context);
                        });
                      },
                    ))
                .toList()
            //muestra el menu
            /*
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Text(
                  "> Este es otro ",
                  style: Styles.drawerOptionStyle,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(13),
              child: Text(
                "> Todos los arcticulos sobre Colombia",
                style: Styles.drawerOptionStyle,
              ),
            ),
            */
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: BuildView(
          viewName: viewName,
          intNews: intNews,
        ),
        /*
        child: ListView(
          children: NewsRepository()
              .NEWS
              .map((news) => NewsCard(
                    news: news,
                  ))
              .toList(),
        ),*/
      ),
    );
  }
}
