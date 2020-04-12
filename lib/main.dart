import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:url_launcher/url_launcher.dart';
import 'src/articles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'List App Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> _articles = articles;
  DateTime pickedDate;

  var rando = Random();

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.length.toString() + " Stories"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
          setState(() {
            _articles.removeAt(0);
          });
        },
        child: ListView(
          children: _articles.map(_buildItem).toList(),
        ),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _buildItem(Article article) {
    // if (article.text.contains("fuck"))
    //   return Container(
    //     color: Colors.black54,
    //     child: Center(
    //       child: Text("Next Topic!",
    //           style: TextStyle(fontSize: 28.0, color: Colors.white)),
    //     ),
    //   );
    return Padding(
      key: Key(article.hashCode.toString()),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
//        leading: Icon(Icons.bookmark_border),
        title: Text(
          article.text,
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle: Text("${article.by}"),
        trailing: CircleAvatar(
          child: Text(rando.nextInt(100).toString()),  //pickedDate.day old
          ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
//              Text("${article.commentsCount} comments!"),
              Text("${article.by}"),
              FlatButton(
                child: Icon(Icons.launch),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
