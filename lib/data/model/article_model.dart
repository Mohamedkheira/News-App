class ArticleModel{
  String title;
  String image;
  String source;
  DateTime date;
  ArticleModel({required this.image,required this.title,required this.source,required this.date});

  static List<ArticleModel> articles = [
    ArticleModel(image: "https://media.istockphoto.com/id/474361108/photo/kick-in-jump.jpg?s=612x612&w=0&k=20&c=hDOR0yteTdmxyzc0swUJXq8zOkJkWkb5qpGz57aUqqg=",
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News", date: DateTime.now(),),
    ArticleModel(image: "https://media.istockphoto.com/id/474361108/photo/kick-in-jump.jpg?s=612x612&w=0&k=20&c=hDOR0yteTdmxyzc0swUJXq8zOkJkWkb5qpGz57aUqqg=",
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News", date: DateTime.now().subtract(Duration(hours: 1)),),
    ArticleModel(image: "https://media.istockphoto.com/id/474361108/photo/kick-in-jump.jpg?s=612x612&w=0&k=20&c=hDOR0yteTdmxyzc0swUJXq8zOkJkWkb5qpGz57aUqqg=",
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News", date: DateTime.now().subtract(Duration(hours: 2)),),
    ArticleModel(image: "https://media.istockphoto.com/id/474361108/photo/kick-in-jump.jpg?s=612x612&w=0&k=20&c=hDOR0yteTdmxyzc0swUJXq8zOkJkWkb5qpGz57aUqqg=",
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News", date: DateTime.now().subtract(Duration(hours: 3)),),
    ArticleModel(image: "https://media.istockphoto.com/id/474361108/photo/kick-in-jump.jpg?s=612x612&w=0&k=20&c=hDOR0yteTdmxyzc0swUJXq8zOkJkWkb5qpGz57aUqqg=",
        title: "Why are football's biggest clubs starting a new tournament?",
        source: "BBC News", date: DateTime.now().subtract(Duration(hours: 4)),),
  ] ;
}