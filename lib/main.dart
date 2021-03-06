import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math';
// import 'package:url_launcher/url_launcher.dart';
import 'src/articles.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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
  int tally;

  String lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus scelerisque nunc id porta gravida. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam nec mauris et enim ornare pellentesque. Nulla vehicula, ex et blandit luctus, mi lectus congue diam, volutpat posuere nisl velit et tellus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam vehicula congue nulla. Curabitur metus lorem, efficitur quis justo eu, fermentum cursus elit.';
  var rando = Random();
  Future<String> _loadJsonFile() async {
    return await rootBundle.loadString('lib/src/sample.json');
  }

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    tally = 0;
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
          radius: 30,
          child: Text(article.score.toString(),
          style: TextStyle(fontWeight: FontWeight.bold)),  
          ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(lorem,
              maxLines: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: (){
                      setState(() {
                        tally = article.score;
                        tally--;
                      });
                    },
                  ),
                  CircleAvatar(child: Text(tally.toString(), style: TextStyle(fontWeight: FontWeight.bold))),
                  IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: (){
                      setState(() {
                        tally = article.score++;
                      });
                    },
                  ),
                ],
              ),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
