class Article{
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final int poll;
  final List<int> kids;
  final String url;
  final int score;
  final String title;
  final List<int> parts;
  final int descendants;

  const Article({
    this.id, this.deleted, this.type, this.by, this.time, this.text, this.dead, this.parent,
    this.poll, this.kids, this.url, this.score, this.title, this.parts, this.descendants
});

  Article.fromJson(Map<String, dynamic> json)
  : id = json['id'],
    deleted = json['deleted'],
    type = json['type'],
    by = json['by'],
    time = json['time'],
    text = json['text'],
    dead = json['dead'],
    parent = json['parent'],
    poll = json['poll'],
    kids = json['kids'],
    url = json['url'],
    score = json['score'],
    title = json['title'],
    parts = json['parts'],
    descendants = json['descendants'];


  Map<String, dynamic> toJson() => 
  {
    'id': id,
    'deleted': deleted,
    'type': type,
    'by': by,
    'time': time,
    'text': text,
    'dead': dead,
    'parent': parent,
    'poll': poll,
    'kids': kids,
    'url': url,
    'score': score,
    'title': title,
    'parts': parts,
    'descendants': descendants
  };
}

final articles = 
[
  new Article(
    by:"dhouston",
    descendants:71,
    id:8863,
    kids:[9224,8917,8952,8884,8887,8869,8958,8940,8908,9005,8873,9671,9067,9055,8865,8881,8872,8955,10403,8903,8928,9125,8998,8901,8902,8907,8894,8870,8878,8980,8934,8943,8876],
    score:104,
    time:1175714200,
    title:"My YC app: Dropbox - Throw away your USB drive",
    type:"story",
    url:"http://www.getdropbox.com/u/2/screencast.html")
];