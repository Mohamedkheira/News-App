import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse/Article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "details";
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)?.settings.arguments as Article;
    var height = MediaQuery.of(context).size.height;
     return Container(
       decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/images/background.png'),
           )
       ),
       child: Scaffold(
        appBar: AppBar(
          title: Text(
            article.title??'',
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage??"",
                  height: height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                article.source?.name??'',style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                article.title??'',style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,

              ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight ,
                child: Text(
                  timeago.format(DateTime.parse(article.publishedAt??"")),style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      article.description??"",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        child: TextButton(
                            onPressed: (){
                              launcherUrlWeb(article.url??"");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Viwe web'
                                ),
                                Icon(Icons.arrow_forward)
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
           ),
     );
  }
} 

void launcherUrlWeb(String uri) async {
 final Uri myYri = Uri.parse(uri);
  bool canLauncher = await canLaunchUrl(myYri);
  if(canLauncher){
    launchUrlString(uri);
    launchUrl(myYri);
  }else{
    print(
      "cannot launcher"
    );
  }
}
